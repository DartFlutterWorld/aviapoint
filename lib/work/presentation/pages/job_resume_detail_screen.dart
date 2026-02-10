import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/photo_viewer.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_experience_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_education_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/job_resume_detail_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/job_resume_edit_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_resumes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class JobResumeDetailScreen extends StatefulWidget {
  final int id;

  const JobResumeDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  State<JobResumeDetailScreen> createState() => _JobResumeDetailScreenState();
}

class _JobResumeDetailScreenState extends State<JobResumeDetailScreen> {
  late final JobResumeDetailBloc _bloc;
  bool _isFavorite = false;
  List<JobResumeExperienceEntity> _experiences = [];
  List<JobResumeEducationEntity> _educations = [];

  @override
  void initState() {
    super.initState();
    _bloc = JobResumeDetailBloc(repository: getIt<JobsRepository>())..add(JobResumeDetailEvent.getById(id: widget.id));
    _loadExperiencesAndEducations();
  }

  Future<void> _loadExperiencesAndEducations() async {
    final repo = getIt<JobsRepository>();
    final expResult = await repo.getResumeExperiences(widget.id);
    final eduResult = await repo.getResumeEducations(widget.id);
    if (!mounted) return;
    expResult.fold((_) => null, (list) => setState(() => _experiences = list));
    eduResult.fold((_) => null, (list) => setState(() => _educations = list));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<void> _toggleResumeFavorite(int id) async {
    final repo = getIt<JobsRepository>();
    if (_isFavorite) {
      final result = await repo.removeResumeFromFavorites(id);
      if (!mounted) return;
      result.fold((failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message ?? 'Не удалось убрать из избранного'), backgroundColor: Colors.red)), (_) {
        setState(() => _isFavorite = false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Убрано из избранного'), backgroundColor: Colors.green));
        _refreshResumesList();
      });
    } else {
      final result = await repo.addResumeToFavorites(id);
      if (!mounted) return;
      result.fold((failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message ?? 'Не удалось добавить в избранное'), backgroundColor: Colors.red)), (_) {
        setState(() => _isFavorite = true);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Добавлено в избранное'), backgroundColor: Colors.green));
        _refreshResumesList();
      });
    }
  }

  void _refreshResumesList() {
    final rootContext = navigatorKey.currentContext;
    if (rootContext != null && rootContext.mounted) {
      rootContext.read<JobsResumesBloc>().add(const JobsResumesEvent.refresh());
    }
  }

  @override
  Widget build(BuildContext context) {
    final editBloc = JobResumeEditBloc(repository: getIt<JobsRepository>());

    return MultiBlocProvider(
      providers: [
        BlocProvider<JobResumeDetailBloc>.value(value: _bloc),
        BlocProvider<JobResumeEditBloc>.value(value: editBloc),
      ],
      child: BlocListener<JobResumeEditBloc, JobResumeEditState>(
        listener: (context, state) {
          state.maybeWhen(
            deleted: (id) {
              getIt<JobsResumesRefreshCubit>().notify();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Резюме удалено'), backgroundColor: Colors.green));
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) context.router.maybePop(true);
              });
            },
            error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
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
              title: 'Резюме',
              withBack: true,
              onTap: () => context.router.maybePop(true),
              actions: [
                BlocBuilder<JobResumeDetailBloc, JobResumeDetailState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (resume) {
                        final profileState = context.read<ProfileBloc>().state;
                        final int? currentUserId = profileState is SuccessProfileState ? profileState.profile.id : null;
                        final bool isOwner = currentUserId != null && resume.userId == currentUserId;

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: _isFavorite ? Colors.red : null),
                              onPressed: () => _toggleResumeFavorite(resume.id),
                            ),
                            if (isOwner) ...[
                              IconButton(
                                icon: const Icon(Icons.edit, color: AppColors.primary100p),
                                onPressed: () async {
                                  await context.router.push(EditJobResumeRoute(id: resume.id));
                                  _bloc.add(JobResumeDetailEvent.getById(id: widget.id));
                                  _loadExperiencesAndEducations();
                                },
                                tooltip: 'Редактировать',
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _showDeleteResumeConfirmation(context, resume.id),
                                tooltip: 'Удалить',
                              ),
                            ],
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
            backgroundColor: AppColors.background,
            body: BlocBuilder<JobResumeDetailBloc, JobResumeDetailState>(
              builder: (context, state) => state.when(
                loading: () => const Center(child: LoadingCustom()),
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                  child: ErrorCustom(
                    textError: errorForUser,
                    repeat: () => _bloc.add(JobResumeDetailEvent.getById(id: widget.id)),
                  ),
                ),
                success: (resume) => _buildContent(context, resume),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, JobResumeEntity resume) {
    final salaryText = resume.desiredSalary != null ? '${_formatMoney(resume.desiredSalary!)} ${resume.currency ?? 'RUB'}' : null;
    final addressText = _resumeAddressText(resume);
    final fio = _buildFio(resume);
    final ageText = _buildAgeText(resume);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Блок "шапка" резюме
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.strokeForDarkArea),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Аватар кандидата (меньше, с возможностью полноэкранного просмотра)
                  if (resume.photoUrl != null && resume.photoUrl!.isNotEmpty)
                    GestureDetector(
                      onTap: () => PhotoViewer.show(context, [resume.photoUrl, ...(resume.additionalPhotoUrls ?? [])]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          width: 72,
                          height: 72,
                          color: AppColors.strokeForDarkArea,
                          child: Image.network(
                            getImageUrl(resume.photoUrl!),
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                            },
                            errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.person, size: 40, color: Color(0xFF9CA5AF))),
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(color: AppColors.strokeForDarkArea, borderRadius: BorderRadius.circular(999)),
                      child: const Icon(Icons.person, size: 40, color: Color(0xFF9CA5AF)),
                    ),
                  const SizedBox(width: 16),
                  // Текстовый блок: название резюме, ФИО, возраст, должность, город, зарплата, "бейджи"
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resume.title,
                          style: AppStyles.bold20s.copyWith(color: AppColors.textPrimary, height: 1.3),
                        ),
                        const SizedBox(height: 4),
                        if (fio != null && fio.isNotEmpty)
                          Text(
                            fio,
                            style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary),
                          ),
                        if (ageText != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            'Возраст: $ageText',
                            style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                        const SizedBox(height: 4),
                        if (resume.currentPosition != null && resume.currentPosition!.isNotEmpty) Text(resume.currentPosition!, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
                        if (addressText != null) ...[
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.place, size: 18, color: Color(0xFF9CA5AF)),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(addressText, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
                              ),
                            ],
                          ),
                        ],
                        if (salaryText != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.payments_outlined, size: 18, color: AppColors.primary100p),
                              const SizedBox(width: 6),
                              Text(salaryText, style: AppStyles.bold16s.copyWith(color: AppColors.primary100p)),
                            ],
                          ),
                        ],
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            if (resume.employmentTypes != null) ..._splitCsv(resume.employmentTypes!).map((e) => _chip(_mapEmploymentType(e))),
                            if (resume.schedules != null) ..._splitCsv(resume.schedules!).map((e) => _chip(_mapSchedule(e))),
                            if (resume.readyToRelocate == true) _chip('Готов к переезду'),
                            if (resume.readyForBusinessTrips == true) _chip('Готов к командировкам'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (addressText != null) ...[
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.strokeForDarkArea),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: LocationPickerWidget(key: ValueKey(addressText), initialLocation: addressText, readOnly: true, showSearch: false),
              ),
            ),
          ],
          if (resume.about != null && resume.about!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.strokeForDarkArea),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('О себе', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  Text(resume.about!, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary, height: 1.4)),
                ],
              ),
            ),
          ],
          if (_experiences.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.strokeForDarkArea),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Опыт работы', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  ..._experiences.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.companyName, style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 2),
                          Text(() {
                            final start = formatDateToDisplay(e.startDate);
                            final end = e.isCurrent == true ? 'по н.в.' : formatDateToDisplay(e.endDate);
                            return [start, end].where((s) => s.isNotEmpty).join(' — ');
                          }(), style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                          if (e.responsibilitiesAndAchievements != null && e.responsibilitiesAndAchievements!.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(e.responsibilitiesAndAchievements!, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary, height: 1.4)),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_educations.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.strokeForDarkArea),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Образование', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  ..._educations.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.institution, style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                          if (e.speciality != null && e.speciality!.isNotEmpty) Text(e.speciality!, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
                          if (e.yearStart != null || e.yearEnd != null || e.isCurrent == true)
                            Text(() {
                              final start = formatYearToDisplay(e.yearStart);
                              final end = e.isCurrent == true ? 'по н.в.' : formatYearToDisplay(e.yearEnd);
                              return [start, end].where((s) => s.isNotEmpty).join(' — ');
                            }(), style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          _buildExperienceSection(resume),
          const SizedBox(height: 16),
          _buildSkillsSection(resume),
          if (_hasAnyResumeContact(resume)) ...[
            const SizedBox(height: 16),
            Text('Контакты кандидата', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            if (resume.contactName != null && resume.contactName!.isNotEmpty) ...[
              Text(resume.contactName!, style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 8),
            ],
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (resume.contactPhone != null && resume.contactPhone!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.phone,
                    label: formatPhone(resume.contactPhone!),
                    color: const Color(0xFF10B981),
                    onTap: () => _launchPhone(context, resume.contactPhone!),
                  ),
                if (resume.contactPhoneAlt != null && resume.contactPhoneAlt!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.phone,
                    label: formatPhone(resume.contactPhoneAlt!),
                    color: const Color(0xFF10B981),
                    onTap: () => _launchPhone(context, resume.contactPhoneAlt!),
                  ),
                if (resume.contactTelegram != null && resume.contactTelegram!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    iconAsset: Pictures.telegramm,
                    label: resume.contactTelegram!,
                    color: const Color(0xFF0088CC),
                    onTap: () => _launchTelegram(context, resume.contactTelegram!),
                  ),
                if (resume.contactWhatsapp != null && resume.contactWhatsapp!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    iconAsset: Pictures.whatsapp,
                    label: resume.contactWhatsapp!,
                    color: const Color(0xFF22C55E),
                    onTap: () => _launchWhatsapp(context, resume.contactWhatsapp!),
                  ),
                if (resume.contactMax != null && resume.contactMax!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    iconAsset: Pictures.max,
                    label: resume.contactMax!,
                    color: const Color(0xFF9CA5AF),
                    onTap: () => _launchMax(context, resume.contactMax!),
                  ),
                if (resume.contactEmail != null && resume.contactEmail!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.email,
                    label: resume.contactEmail!,
                    color: const Color(0xFF3B82F6),
                    onTap: () => _launchEmail(context, resume.contactEmail!),
                  ),
                if (resume.contactSite != null && resume.contactSite!.isNotEmpty)
                  _buildContactButton(
                    context: context,
                    icon: Icons.language,
                    label: resume.contactSite!,
                    color: const Color(0xFF6366F1),
                    onTap: () => _launchSite(context, resume.contactSite!),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 24),
          ..._buildManagementIfOwner(context, resume),
          const SizedBox(height: 16),
        ],
      ),
    );
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

  String? _resumeAddressText(JobResumeEntity r) {
    if (r.address != null && r.address!.isNotEmpty) {
      return r.address;
    }
    return null;
  }

  Iterable<String> _splitCsv(String? value) {
    if (value == null || value.isEmpty) return const [];
    return value.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
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

  /// Строим ФИО кандидата из контактного имени резюме (если указано).
  /// При необходимости можно расширить до использования данных профиля пользователя.
  String? _buildFio(JobResumeEntity r) {
    if (r.contactName != null && r.contactName!.trim().isNotEmpty) {
      return r.contactName!.trim();
    }
    return null;
  }

  /// Возвращает строку вида "34 года (01.01.1992)" или null, если даты нет/не парсится.
  String? _buildAgeText(JobResumeEntity r) {
    final dobStr = r.dateOfBirth;
    if (dobStr == null || dobStr.isEmpty) return null;
    final dob = DateTime.tryParse(dobStr);
    if (dob == null) return null;

    final now = DateTime.now();
    int age = now.year - dob.year;
    final hasHadBirthday = now.month > dob.month || (now.month == dob.month && now.day >= dob.day);
    if (!hasHadBirthday) age -= 1;
    if (age < 0 || age > 120) return null;

    String suffix;
    final mod10 = age % 10;
    final mod100 = age % 100;
    if (mod10 == 1 && mod100 != 11) {
      suffix = 'год';
    } else if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
      suffix = 'года';
    } else {
      suffix = 'лет';
    }

    final formattedDob = formatDateToDisplay(dobStr);
    return '$age $suffix ($formattedDob)';
  }

  Widget _buildExperienceSection(JobResumeEntity r) {
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

    if (r.flightHoursTotal != null) {
      addRow('Налёт всего', '${r.flightHoursTotal} ч');
    }
    if (r.flightHoursPic != null) {
      addRow('Налёт PIC', '${r.flightHoursPic} ч');
    }
    addRow('Мед. допуск', r.medicalClass);

    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Опыт и лётные данные', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        ...rows,
      ],
    );
  }

  Widget _buildSkillsSection(JobResumeEntity r) {
    final chips = <Widget>[];

    for (final license in _splitCsv(r.licenses)) {
      chips.add(_chip(license));
    }
    for (final type in _splitCsv(r.typeRatings)) {
      chips.add(_chip(type));
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Квалификация', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        Wrap(spacing: 8, runSpacing: 6, children: chips),
      ],
    );
  }

  List<Widget> _buildManagementIfOwner(BuildContext context, JobResumeEntity resume) {
    final profileState = context.read<ProfileBloc>().state;
    final int? currentUserId = profileState is SuccessProfileState ? profileState.profile.id : null;
    final bool isOwner = currentUserId != null && resume.userId == currentUserId;

    if (!isOwner) return [];

    return [
      SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () async {
            await context.router.push(EditJobResumeRoute(id: resume.id));
            _bloc.add(JobResumeDetailEvent.getById(id: widget.id));
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
      const SizedBox(height: 16),
    ];
  }

  void _showDeleteResumeConfirmation(BuildContext context, int resumeId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить резюме'),
        content: const Text('Вы уверены, что хотите удалить это резюме?'),
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
      context.read<JobResumeEditBloc>().add(JobResumeEditEvent.delete(id: resumeId));
    }
  }

  Widget _buildContactButton({required BuildContext context, IconData? icon, String? iconAsset, required String label, required Color color, required VoidCallback onTap}) {
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
              SvgPicture.asset(iconAsset, width: 16, height: 16, colorFilter: (iconAsset == Pictures.max || iconAsset == Pictures.telegramm) ? null : ColorFilter.mode(color, BlendMode.srcIn))
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

  bool _hasAnyResumeContact(JobResumeEntity r) {
    return (r.contactName != null && r.contactName!.isNotEmpty) ||
        (r.contactPhone != null && r.contactPhone!.isNotEmpty) ||
        (r.contactPhoneAlt != null && r.contactPhoneAlt!.isNotEmpty) ||
        (r.contactTelegram != null && r.contactTelegram!.isNotEmpty) ||
        (r.contactWhatsapp != null && r.contactWhatsapp!.isNotEmpty) ||
        (r.contactMax != null && r.contactMax!.isNotEmpty) ||
        (r.contactEmail != null && r.contactEmail!.isNotEmpty) ||
        (r.contactSite != null && r.contactSite!.isNotEmpty);
  }

  Future<void> _launchPhone(BuildContext context, String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось совершить звонок'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchTelegram(BuildContext context, String telegram) async {
    final username = telegram.replaceAll('@', '');
    final uri = Uri.parse('https://t.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)));
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
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Неверный формат WhatsApp'), duration: Duration(seconds: 2)));
      }
      return;
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть WhatsApp'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchMax(BuildContext context, String max) async {
    final username = max.replaceAll('@', '');
    final uri = Uri.parse('https://max.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть MAX'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchEmail(BuildContext context, String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть почту'), duration: Duration(seconds: 2)));
    }
  }

  Future<void> _launchSite(BuildContext context, String site) async {
    final trimmed = site.trim();
    final url = trimmed.startsWith('http') ? trimmed : 'https://$trimmed';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть ссылку'), duration: Duration(seconds: 2)));
    }
  }
}
