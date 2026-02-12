import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/presentation/widgets/photo_viewer.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/utils/address_display_helper.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_edit_bloc.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_detail_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_vacancies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class JobVacancyDetailScreen extends StatefulWidget {
  final int id;

  const JobVacancyDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  State<JobVacancyDetailScreen> createState() => _JobVacancyDetailScreenState();
}

class _JobVacancyDetailScreenState extends State<JobVacancyDetailScreen> {
  late final JobVacancyDetailBloc _bloc;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _bloc = JobVacancyDetailBloc(repository: getIt<JobsRepository>())
      ..add(JobVacancyDetailEvent.getById(id: widget.id));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<void> _toggleVacancyFavorite(int id) async {
    final repo = getIt<JobsRepository>();
    if (_isFavorite) {
      final result = await repo.removeVacancyFromFavorites(id);
      if (!mounted) return;
      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message ?? 'Не удалось убрать из избранного'), backgroundColor: Colors.red),
        ),
        (_) {
          setState(() => _isFavorite = false);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Убрано из избранного'), backgroundColor: Colors.green));
          _refreshVacanciesList();
        },
      );
    } else {
      final result = await repo.addVacancyToFavorites(id);
      if (!mounted) return;
      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message ?? 'Не удалось добавить в избранное'), backgroundColor: Colors.red),
        ),
        (_) {
          setState(() => _isFavorite = true);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Добавлено в избранное'), backgroundColor: Colors.green));
          _refreshVacanciesList();
        },
      );
    }
  }

  void _refreshVacanciesList() {
    final rootContext = navigatorKey.currentContext;
    if (rootContext != null && rootContext.mounted) {
      rootContext.read<JobsVacanciesBloc>().add(const JobsVacanciesEvent.refresh(includeInactive: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final editBloc = JobVacancyEditBloc(repository: getIt<JobsRepository>());

    return MultiBlocProvider(
      providers: [
        BlocProvider<JobVacancyDetailBloc>.value(value: _bloc),
        BlocProvider<JobVacancyEditBloc>.value(value: editBloc),
      ],
      child: BlocListener<JobVacancyEditBloc, JobVacancyEditState>(
        listener: (context, state) {
          state.maybeWhen(
            deleted: (id) {
              getIt<JobsVacanciesRefreshCubit>().notify();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Вакансия удалена'), backgroundColor: Colors.green));
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) context.router.maybePop(true);
              });
            },
            published: (vacancy) {
              getIt<JobsVacanciesRefreshCubit>().notify();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Вакансия опубликована'), backgroundColor: Colors.green));
              _bloc.add(JobVacancyDetailEvent.getById(id: widget.id));
              _refreshVacanciesList();
            },
            unpublished: (vacancy) {
              getIt<JobsVacanciesRefreshCubit>().notify();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Вакансия снята с публикации'), backgroundColor: Colors.green),
              );
              _bloc.add(JobVacancyDetailEvent.getById(id: widget.id));
              _refreshVacanciesList();
            },
            error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
            },
            orElse: () {},
          );
        },
        child: PopScope(
          canPop: true,
          onPopInvokedWithResult: (bool didPop, dynamic _) async {
            if (didPop) return;
            if (context.mounted) Navigator.of(context).pop(true);
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'Вакансия',
              withBack: true,
              onTap: () => context.router.maybePop(true),
              actions: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, _) {
                    return BlocBuilder<JobVacancyDetailBloc, JobVacancyDetailState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (vacancy) {
                            final canEdit = PermissionHelper.isOwnerOrAdmin(vacancy.employerId, context);

                            return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                _isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: _isFavorite ? Colors.red : null,
                              ),
                              onPressed: () => _toggleVacancyFavorite(vacancy.id),
                            ),
                            if (canEdit) ...[
                              IconButton(
                                icon: const Icon(Icons.edit, color: AppColors.primary100p),
                                onPressed: () async {
                                  await context.router.push(EditJobVacancyRoute(id: vacancy.id));
                                  _bloc.add(JobVacancyDetailEvent.getById(id: widget.id));
                                },
                                tooltip: 'Редактировать',
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _showDeleteVacancyConfirmation(context, vacancy.id),
                                tooltip: 'Удалить',
                              ),
                            ],
                          ],
                        );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            backgroundColor: AppColors.background,
            body: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, _) {
                return BlocBuilder<JobVacancyDetailBloc, JobVacancyDetailState>(
                  builder: (context, state) => state.when(
                    loading: () => const Center(child: LoadingCustom()),
                    error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                      child: ErrorCustom(
                        textError: errorForUser,
                        repeat: () => _bloc.add(JobVacancyDetailEvent.getById(id: widget.id)),
                      ),
                    ),
                    success: (vacancy) => _buildContent(context, vacancy),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, JobVacancyEntity vacancy) {
    final salaryText = _salaryText(vacancy);
    final locationText = _locationText(vacancy);
    final hasLogo = vacancy.logoUrl != null && vacancy.logoUrl!.isNotEmpty;
    final allPhotos = [
      if (hasLogo) vacancy.logoUrl!,
      ...vacancy.additionalImageUrls,
    ];
    final profileState = context.read<ProfileBloc>().state;
    final int? currentUserId = profileState is SuccessProfileState ? profileState.profile.id : null;
    final bool isOwner = currentUserId != null && vacancy.employerId == currentUserId;
    final showRespondedPlaque = !isOwner && vacancy.userHasResponded == true;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showRespondedPlaque) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primary100p.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary100p.withOpacity(0.4)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 20, color: AppColors.primary100p),
                  const SizedBox(width: 8),
                  Text(
                    'Вы уже откликнулись на эту вакансию',
                    style: AppStyles.bold14s.copyWith(color: AppColors.primary100p),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vacancy.title, style: AppStyles.bold20s.copyWith(color: AppColors.textPrimary, height: 1.3)),
                if (vacancy.isPrivate == true) ...[
                  const SizedBox(height: 6),
                  Text('Частное лицо', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
                ],
                if (salaryText != null) ...[
                  const SizedBox(height: 10),
                  Text(salaryText, style: AppStyles.bold18s.copyWith(color: AppColors.primary100p)),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    if (vacancy.employmentType != null) _chip(_mapEmploymentType(vacancy.employmentType!)),
                    if (vacancy.schedule != null) _chip(_mapSchedule(vacancy.schedule!)),
                    if (vacancy.experienceLevel != null) _chip(_mapExperience(vacancy.experienceLevel!)),
                    if (vacancy.educationLevel != null && vacancy.educationLevel!.isNotEmpty) _chip(vacancy.educationLevel!),
                    if (vacancy.relocationAllowed == true) _chip('Релокация возможна'),
                    if (vacancy.businessTrips != null && vacancy.businessTrips!.isNotEmpty)
                      _chip('Командировки: ${vacancy.businessTrips}'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (vacancy.description != null && vacancy.description!.isNotEmpty) ...[
            Text('Описание вакансии', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Text(
              vacancy.description!,
              style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary, height: 1.4),
            ),
            const SizedBox(height: 16),
          ],
          if (vacancy.responsibilities != null && vacancy.responsibilities!.isNotEmpty) ...[
            Text('Обязанности', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Text(
              vacancy.responsibilities!,
              style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary, height: 1.4),
            ),
            const SizedBox(height: 16),
          ],
          if (vacancy.requirements != null && vacancy.requirements!.isNotEmpty) ...[
            Text('Требования', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Text(
              vacancy.requirements!,
              style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary, height: 1.4),
            ),
            const SizedBox(height: 16),
          ],
          if (vacancy.conditions != null && vacancy.conditions!.isNotEmpty) ...[
            Text('Условия', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Text(
              vacancy.conditions!,
              style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary, height: 1.4),
            ),
            const SizedBox(height: 16),
          ],
          _buildMetaSection(vacancy),
          const SizedBox(height: 24),
          _buildContactsAndCompanyCard(context, vacancy, allPhotos),
          if (locationText != null) ...[
            const SizedBox(height: 16),
            Text('Адрес', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Text(locationText, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 12),
            LocationPickerWidget(
              key: ValueKey(locationText),
              initialLocation: locationText,
              readOnly: true,
              showSearch: false,
            ),
          ],
          const SizedBox(height: 24),
          ..._buildManagementOrRespond(context, vacancy),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildContactsAndCompanyCard(BuildContext context, JobVacancyEntity vacancy, List<String> allPhotos) {
    final hasContacts = vacancy.contactName != null ||
        vacancy.contactPosition != null ||
        vacancy.contactPhone != null ||
        vacancy.contactPhoneAlt != null ||
        vacancy.contactTelegram != null ||
        vacancy.contactWhatsapp != null ||
        vacancy.contactMax != null ||
        vacancy.contactEmail != null ||
        vacancy.contactSite != null;
    final hasCompanyInfo = vacancy.isPrivate != true &&
        ((vacancy.companyName != null && vacancy.companyName!.isNotEmpty) ||
            (vacancy.inn != null && vacancy.inn!.isNotEmpty));
    final hasPhotos = allPhotos.isNotEmpty;

    if (!hasContacts && !hasCompanyInfo && !hasPhotos) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (vacancy.additionalImageUrls.isNotEmpty) ...[
            _buildAttachedFilesSection(context, vacancy),
            if (hasContacts || hasCompanyInfo || hasPhotos) const SizedBox(height: 16),
          ],
          if (hasContacts) ...[
            Text(
              vacancy.isPrivate == true ? 'Контакты частного лица' : 'Контакты компании',
              style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 12),
            if (vacancy.contactName != null && vacancy.contactName!.isNotEmpty) ...[
              Text(vacancy.contactName!, style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 4),
            ],
            if (vacancy.contactPosition != null && vacancy.contactPosition!.isNotEmpty) ...[
              Text(vacancy.contactPosition!, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 12),
            ],
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (vacancy.contactPhone != null && vacancy.contactPhone!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.phone,
                    label: formatPhone(vacancy.contactPhone!),
                    color: const Color(0xFF10B981),
                    onTap: () => _launchPhone(context, vacancy.contactPhone!),
                  ),
                if (vacancy.contactPhoneAlt != null && vacancy.contactPhoneAlt!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.phone,
                    label: formatPhone(vacancy.contactPhoneAlt!),
                    color: const Color(0xFF10B981),
                    onTap: () => _launchPhone(context, vacancy.contactPhoneAlt!),
                  ),
                if (vacancy.contactTelegram != null && vacancy.contactTelegram!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    iconAsset: Pictures.telegramm,
                    label: vacancy.contactTelegram!,
                    color: const Color(0xFF0088CC),
                    onTap: () => _launchTelegram(context, vacancy.contactTelegram!),
                  ),
                if (vacancy.contactWhatsapp != null && vacancy.contactWhatsapp!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    iconAsset: Pictures.whatsapp,
                    label: vacancy.contactWhatsapp!,
                    color: const Color(0xFF22C55E),
                    onTap: () => _launchWhatsapp(context, vacancy.contactWhatsapp!),
                  ),
                if (vacancy.contactMax != null && vacancy.contactMax!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    iconAsset: Pictures.max,
                    label: vacancy.contactMax!,
                    color: const Color(0xFF9CA5AF),
                    onTap: () => _launchMax(context, vacancy.contactMax!),
                  ),
                if (vacancy.contactEmail != null && vacancy.contactEmail!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.email,
                    label: vacancy.contactEmail!,
                    color: const Color(0xFF3B82F6),
                    onTap: () => _launchEmail(context, vacancy.contactEmail!),
                  ),
                if (vacancy.contactSite != null && vacancy.contactSite!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.language,
                    label: vacancy.contactSite!,
                    color: const Color(0xFF6366F1),
                    onTap: () => _launchSite(context, vacancy.contactSite!),
                  ),
              ],
            ),
          ],
          if (hasCompanyInfo || hasPhotos) ...[
            if (hasContacts) const SizedBox(height: 20),
            Text(
              vacancy.isPrivate == true ? 'Фотографии' : 'О компании',
              style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 12),
            if (hasCompanyInfo)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (allPhotos.isNotEmpty) ...[
                    GestureDetector(
                      onTap: () => PhotoViewer.show(context, allPhotos, initialIndex: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          getImageUrl(allPhotos.first),
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 64,
                            height: 64,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.business, size: 32),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (vacancy.companyName != null && vacancy.companyName!.isNotEmpty)
                          Text(
                            vacancy.companyName!,
                            style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary),
                          ),
                        if (vacancy.inn != null && vacancy.inn!.isNotEmpty) ...[
                          if (vacancy.companyName != null && vacancy.companyName!.isNotEmpty) const SizedBox(height: 4),
                          Text(
                            'ИНН: ${vacancy.inn}',
                            style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            if (hasPhotos && !hasCompanyInfo && vacancy.additionalImageUrls.isEmpty)
              GestureDetector(
                onTap: () => PhotoViewer.show(context, allPhotos, initialIndex: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    getImageUrl(allPhotos.first),
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 180,
                      color: Colors.grey.shade200,
                      child: const Center(child: Icon(Icons.image_not_supported, size: 48)),
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildAttachedFilesSection(BuildContext context, JobVacancyEntity vacancy) {
    final urls = vacancy.additionalImageUrls;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokeForDarkArea),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.attach_file, size: 22, color: AppColors.primary100p),
              const SizedBox(width: 12),
              Text('Прикреплённые файлы', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            ],
          ),
          const SizedBox(height: 12),
          ...urls.asMap().entries.map((entry) {
            final index = entry.key;
            final url = entry.value;
            final lower = url.toLowerCase();
            final isPdf = lower.endsWith('.pdf');
            final isWord = lower.endsWith('.doc') || lower.endsWith('.docx');
            final isExcel = lower.endsWith('.xls') || lower.endsWith('.xlsx');
            final isImage = !isPdf && !isWord && !isExcel;
            IconData icon = Icons.insert_drive_file;
            Color iconColor = AppColors.textSecondary;
            if (isPdf) {
              icon = Icons.picture_as_pdf;
              iconColor = Colors.red;
            } else if (isWord) {
              icon = Icons.description;
              iconColor = Colors.blue;
            } else if (isExcel) {
              icon = Icons.table_chart;
              iconColor = Colors.green;
            } else if (isImage) {
              icon = Icons.image;
              iconColor = AppColors.primary100p;
            }
            final fileName = url.split('/').last.split('?').first;
            final displayName = fileName.isNotEmpty ? fileName : 'Файл ${index + 1}';
            final fullUrl = getImageUrl(url);
            return Padding(
              padding: EdgeInsets.only(bottom: index < urls.length - 1 ? 8 : 0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    if (isImage) {
                      final initialIndex = (vacancy.logoUrl != null && vacancy.logoUrl!.isNotEmpty ? 1 : 0) + index;
                      PhotoViewer.show(context, [if (vacancy.logoUrl != null && vacancy.logoUrl!.isNotEmpty) vacancy.logoUrl!, ...urls], initialIndex: initialIndex);
                    } else {
                      final uri = Uri.parse(fullUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      } else if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Не удалось открыть файл'), backgroundColor: Colors.orange),
                        );
                      }
                    }
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Row(
                      children: [
                        Icon(icon, size: 28, color: iconColor),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            displayName,
                            style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.open_in_new, size: 18, color: AppColors.textSecondary),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  String? _salaryText(JobVacancyEntity v) {
    if (v.salaryFrom == null && v.salaryTo == null) return null;
    final from = v.salaryFrom;
    final to = v.salaryTo;
    final currency = v.currency ?? 'RUB';
    String base;
    if (from != null && to != null) {
      base = '${_formatMoney(from)} – ${_formatMoney(to)} $currency';
    } else if (from != null) {
      base = 'от ${_formatMoney(from)} $currency';
    } else {
      base = 'до ${_formatMoney(to!)} $currency';
    }
    if (v.isGross == true) {
      return '$base (до вычета налогов)';
    }
    return base;
  }

  /// Адрес для детальной страницы: регион/город без дубля или полный address без дубликатов.
  String? _locationText(JobVacancyEntity v) {
    final hasCityOrRegion = (v.city != null && v.city!.trim().isNotEmpty) || (v.region != null && v.region!.trim().isNotEmpty);
    if (hasCityOrRegion) {
      final detail = AddressDisplayHelper.detailDisplay(
        region: v.region,
        city: v.city,
        street: null,
        houseNumber: null,
      );
      if (detail != null && detail.isNotEmpty) return detail;
    }
    return AddressDisplayHelper.locationStringWithoutDuplicates(v.address);
  }

  String _formatMoney(int value) {
    final s = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final indexFromEnd = s.length - i;
      buffer.write(s[i]);
      if (indexFromEnd > 1 && indexFromEnd % 3 == 1) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(999)),
      child: Text(text, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
    );
  }

  String _mapEmploymentType(String value) {
    switch (value) {
      case 'full_time':
        return 'Полная занятость';
      case 'part_time':
        return 'Частичная занятость';
      case 'project':
        return 'Проектная работа';
      case 'internship':
        return 'Стажировка';
      default:
        return value;
    }
  }

  String _mapSchedule(String value) {
    switch (value) {
      case 'office':
        return 'Офис';
      case 'remote':
        return 'Удалённо';
      case 'hybrid':
        return 'Гибрид';
      case 'shift':
        return 'Сменный график';
      case 'fly_in_fly_out':
        return 'Вахта';
      default:
        return value;
    }
  }

  String _mapExperience(String value) {
    switch (value) {
      case 'no_experience':
        return 'Без опыта';
      case '1_3':
        return 'Опыт 1–3 года';
      case '3_6':
        return 'Опыт 3–6 лет';
      case '6_plus':
        return 'Опыт 6+ лет';
      default:
        return value;
    }
  }

  Widget _buildMetaSection(JobVacancyEntity v) {
    final rows = <Widget>[];

    void addRow(String label, String? value) {
      if (value == null || value.isEmpty) return;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(label, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Text(value, style: AppStyles.regular12s.copyWith(color: AppColors.textPrimary)),
              ),
            ],
          ),
        ),
      );
    }

    addRow('Категория ВС', v.aircraftCategory);
    addRow('Требуемая лицензия', v.requiredLicense);
    if (v.minFlightHours != null) {
      addRow('Минимальный налёт', '${v.minFlightHours} ч');
    }
    addRow('Типы ВС', v.requiredTypeRating);

    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Дополнительно', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        ...rows,
      ],
    );
  }

  List<Widget> _buildManagementOrRespond(BuildContext context, JobVacancyEntity vacancy) {
    final canEdit = PermissionHelper.isOwnerOrAdmin(vacancy.employerId, context);

    if (canEdit) {
      return [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {
              await context.router.push(EditJobVacancyRoute(id: vacancy.id));
              _bloc.add(JobVacancyDetailEvent.getById(id: widget.id));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary100p,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.edit, size: 20),
            label: const Text('Редактировать'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => context.router.push(VacancyResponsesRoute(id: vacancy.id)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary100p,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.list_alt, size: 20),
            label: const Text('Отклики'),
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder<JobVacancyEditBloc, JobVacancyEditState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(publishing: () => true, unpublishing: () => true, orElse: () => false);
            final isPublished = vacancy.isPublished;
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isLoading
                    ? null
                    : () {
                        if (isPublished) {
                          context.read<JobVacancyEditBloc>().add(JobVacancyEditEvent.unpublish(id: vacancy.id));
                        } else {
                          context.read<JobVacancyEditBloc>().add(JobVacancyEditEvent.publish(id: vacancy.id));
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPublished ? Colors.red : AppColors.primary100p,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.publish, size: 20),
                label: Text(isPublished ? 'Снять с публикации' : 'Опубликовать'),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ];
    }

    final hasResponded = vacancy.userHasResponded == true;
    return [
      if (!hasResponded)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary100p,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () async {
              await context.router.push(CreateVacancyResponseRoute(id: vacancy.id));
              if (context.mounted) _bloc.add(JobVacancyDetailEvent.getById(id: widget.id));
            },
            child: Text('Откликнуться', style: AppStyles.bold16s.copyWith(color: Colors.white)),
          ),
        ),
      const SizedBox(height: 8),
    ];
  }

  void _showDeleteVacancyConfirmation(BuildContext context, int vacancyId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить вакансию'),
        content: const Text('Вы уверены, что хотите удалить эту вакансию?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Отмена')),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Удалить', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      context.read<JobVacancyEditBloc>().add(JobVacancyEditEvent.delete(id: vacancyId));
    }
  }

  Widget _buildContactButton({
    required BuildContext context,
    IconData? icon,
    String? iconAsset,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconAsset != null)
              SvgPicture.asset(
                iconAsset,
                width: 16,
                height: 16,
                colorFilter: (iconAsset == Pictures.max || iconAsset == Pictures.telegramm)
                    ? null
                    : ColorFilter.mode(color, BlendMode.srcIn),
              )
            else if (icon != null)
              Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: AppStyles.regular12s.copyWith(color: color),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchPhone(BuildContext context, String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось совершить звонок'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchTelegram(BuildContext context, String telegram) async {
    final username = telegram.replaceAll('@', '');
    final uri = Uri.parse('https://t.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchMax(BuildContext context, String max) async {
    final username = max.replaceAll('@', '');
    final uri = Uri.parse('https://max.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось открыть MAX'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchWhatsapp(BuildContext context, String value) async {
    final trimmed = value.trim();
    final normalized = trimmed.replaceAll(RegExp(r'[^\d]'), '');
    final Uri uri;
    if (trimmed.startsWith('http')) {
      uri = Uri.parse(trimmed);
    } else if (normalized.isNotEmpty) {
      uri = Uri.parse('https://wa.me/$normalized');
    } else {
      uri = Uri.parse('https://wa.me/');
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось открыть WhatsApp'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchEmail(BuildContext context, String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось открыть почту'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchSite(BuildContext context, String site) async {
    final trimmed = site.trim();
    final url = trimmed.startsWith('http') ? trimmed : 'https://$trimmed';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось открыть сайт'), duration: Duration(seconds: 2)));
    }
  }
}
