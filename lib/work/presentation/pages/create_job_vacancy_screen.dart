import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/work/domain/entities/job_contact_profile_entity.dart';
import 'package:aviapoint/work/domain/entities/company_short_info.dart';
import 'package:aviapoint/work/domain/repositories/checko_repository.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/contact_profiles_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/checko_company_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_edit_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask/mask/mask.dart';
import 'dart:io';
import 'dart:typed_data';

@RoutePage()
class CreateJobVacancyScreen extends StatefulWidget {
  const CreateJobVacancyScreen({super.key});

  @override
  State<CreateJobVacancyScreen> createState() => _CreateJobVacancyScreenState();
}

class _CreateJobVacancyScreenState extends State<CreateJobVacancyScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _responsibilitiesController;
  late final TextEditingController _requirementsController;
  late final TextEditingController _conditionsController;
  late final TextEditingController _salaryFromController;
  late final TextEditingController _salaryToController;
  late final TextEditingController _innController;
  late final TextEditingController _companyNameController;
  late final TextEditingController _contactNameController;
  late final TextEditingController _contactPositionController;
  late final TextEditingController _contactPhoneController;
  late final TextEditingController _contactPhoneAltController;
  late final TextEditingController _contactTelegramController;
  late final TextEditingController _contactWhatsappController;
  late final TextEditingController _contactMaxController;
  late final TextEditingController _contactEmailController;
  late final TextEditingController _contactSiteController;
  late final TextEditingController _employmentFormController;
  late final TextEditingController _workHoursController;
  late final TextEditingController _skillsController;

  String _currency = 'RUB';
  String? _employmentType;
  String? _schedule;
  String? _experienceLevel;
  String? _educationLevel;
  bool _isGross = true;
  bool _relocationAllowed = false;
  bool _isCompany = true;
  String? _selectedAddress;
  final List<String> _skills = [];
  String? _lastInnLookup;
  int? _selectedContactProfileId;
  _PhotoItem? _logoPhoto;
  List<_PhotoItem> _additionalPhotos = [];
  final _contactFormKey = GlobalKey<FormState>();

  late final JobVacancyEditBloc _bloc;
  late final CheckoCompanyCubit _checkoCubit;
  late final ContactProfilesCubit _contactProfilesCubit;

  @override
  void initState() {
    super.initState();
    _bloc = JobVacancyEditBloc(repository: getIt<JobsRepository>());
    _checkoCubit = CheckoCompanyCubit(repository: getIt<CheckoRepository>());
    _contactProfilesCubit = ContactProfilesCubit(repository: getIt<JobsRepository>())..fetch();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _responsibilitiesController = TextEditingController();
    _requirementsController = TextEditingController();
    _conditionsController = TextEditingController();
    _salaryFromController = TextEditingController();
    _salaryToController = TextEditingController();
    _innController = TextEditingController()..addListener(_onInnChanged);
    _companyNameController = TextEditingController();
    _contactNameController = TextEditingController();
    _contactPositionController = TextEditingController();
    _contactPhoneController = TextEditingController();
    _contactPhoneAltController = TextEditingController();
    _contactTelegramController = TextEditingController();
    _contactWhatsappController = TextEditingController();
    _contactMaxController = TextEditingController();
    _contactEmailController = TextEditingController();
    _contactSiteController = TextEditingController();
    _employmentFormController = TextEditingController();
    _workHoursController = TextEditingController();
    _skillsController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _responsibilitiesController.dispose();
    _requirementsController.dispose();
    _conditionsController.dispose();
    _salaryFromController.dispose();
    _salaryToController.dispose();
    _innController.dispose();
    _companyNameController.dispose();
    _contactNameController.dispose();
    _contactPositionController.dispose();
    _contactPhoneController.dispose();
    _contactPhoneAltController.dispose();
    _contactTelegramController.dispose();
    _contactWhatsappController.dispose();
    _contactMaxController.dispose();
    _contactEmailController.dispose();
    _contactSiteController.dispose();
    _employmentFormController.dispose();
    _workHoursController.dispose();
    _skillsController.dispose();
    _bloc.close();
    _checkoCubit.close();
    _contactProfilesCubit.close();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedContactProfileId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите контактные данные'), backgroundColor: Colors.red));
      return;
    }

    final salaryFrom = _salaryFromController.text.trim().isNotEmpty ? int.parse(_salaryFromController.text.trim()) : null;
    final salaryTo = _salaryToController.text.trim().isNotEmpty ? int.parse(_salaryToController.text.trim()) : null;

    _bloc.add(
      JobVacancyEditEvent.create(
        title: _titleController.text.trim(),
        contactProfileId: _selectedContactProfileId!,
        description: _descriptionController.text.trim().isNotEmpty ? _descriptionController.text.trim() : null,
        responsibilities: _responsibilitiesController.text.trim().isNotEmpty ? _responsibilitiesController.text.trim() : null,
        requirements: _requirementsController.text.trim().isNotEmpty ? _requirementsController.text.trim() : null,
        conditions: _conditionsController.text.trim().isNotEmpty ? _conditionsController.text.trim() : null,
        salaryFrom: salaryFrom,
        salaryTo: salaryTo,
        currency: _currency,
        isGross: _isGross,
        employmentType: _employmentType,
        schedule: _schedule,
        experienceLevel: _experienceLevel,
        educationLevel: _educationLevel,
        employmentForm: _employmentFormController.text.trim().isNotEmpty ? _employmentFormController.text.trim() : null,
        workHours: _workHoursController.text.trim().isNotEmpty ? _workHoursController.text.trim() : null,
        relocationAllowed: _relocationAllowed,
        skills: _skills.isNotEmpty ? List<String>.from(_skills) : null,
      ),
    );
  }

  void _onInnChanged() {
    final value = _innController.text.trim();
    if (_lastInnLookup != null && value != _lastInnLookup) {
      _checkoCubit.reset();
    }
  }

  void _requestCompanyInfo() {
    if (!_isCompany) {
      return;
    }
    final inn = _innController.text.trim();
    if (inn.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Введите ИНН'), backgroundColor: Colors.red));
      return;
    }
    if (!RegExp(r'^\d+$').hasMatch(inn) || (inn.length != 10 && inn.length != 12)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ИНН должен содержать 10 или 12 цифр'), backgroundColor: Colors.red));
      return;
    }
    FocusScope.of(context).unfocus();
    _lastInnLookup = inn;
    _checkoCubit.fetchByInn(inn);
  }

  void _selectDefaultProfile(List<JobContactProfileEntity> profiles) {
    if (_selectedContactProfileId != null || profiles.isEmpty) return;
    final sorted = List<JobContactProfileEntity>.from(profiles);
    sorted.sort((a, b) {
      final aDate = DateTime.tryParse(a.createdAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bDate = DateTime.tryParse(b.createdAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });
    setState(() {
      _selectedContactProfileId = sorted.first.id;
      _isCompany = !sorted.first.isPrivate;
    });
  }

  Future<void> _openContactProfileSheet({JobContactProfileEntity? profile}) async {
    final isEditing = profile != null;
    setState(() {
      if (profile != null) {
        _isCompany = !profile.isPrivate;
      }
      _selectedAddress = profile?.address;
      _logoPhoto = profile?.logoUrl != null && profile!.logoUrl!.isNotEmpty ? _PhotoItem(url: profile.logoUrl, file: null, bytes: null, isNew: false) : null;
      _additionalPhotos = (profile?.additionalImageUrls ?? []).map((url) => _PhotoItem(url: url, file: null, bytes: null, isNew: false)).toList();
    });

    _companyNameController.text = profile?.companyName ?? '';
    _innController.text = profile?.inn ?? '';
    _contactNameController.text = profile?.contactName ?? '';
    _contactPositionController.text = profile?.contactPosition ?? '';
    _contactPhoneController.text = phoneToMaskedInput(profile?.contactPhone);
    _contactPhoneAltController.text = phoneToMaskedInput(profile?.contactPhoneAlt);
    _contactTelegramController.text = profile?.contactTelegram ?? '';
    _contactWhatsappController.text = profile?.contactWhatsapp ?? '';
    _contactMaxController.text = profile?.contactMax ?? '';
    _contactEmailController.text = profile?.contactEmail ?? '';
    _contactSiteController.text = profile?.contactSite ?? '';

    await showUniversalBottomSheet<void>(
      context: context,
      title: 'Контактные данные',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      useRootNavigator: false,
      child: BlocProvider<CheckoCompanyCubit>.value(
        value: _checkoCubit,
        child: StatefulBuilder(
          builder: (context, setSheetState) {
            return Form(
              key: _contactFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    if (_isCompany) ...[
                      CustomTextField(
                        controller: _innController,
                        labelText: 'ИНН компании',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          final trimmed = value?.trim() ?? '';
                          if (trimmed.isEmpty) return null;
                          if (!RegExp(r'^\d+$').hasMatch(trimmed) || (trimmed.length != 10 && trimmed.length != 12)) {
                            return 'ИНН должен содержать 10 или 12 цифр';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      CustomButton(
                        title: 'Получить данные по ИНН',
                        textStyle: AppStyles.bold16s.copyWith(color: AppColors.primary100p),
                        borderColor: AppColors.primary100p,
                        backgroundColor: AppColors.primary5p,
                        boxShadow: const [],
                        onPressed: () async {
                          _requestCompanyInfo();
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<CheckoCompanyCubit, CheckoCompanyState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const LoadingCustom(paddingTop: 0),
                            success: (info) {
                              final displayName = info.shortName ?? info.name;
                              if (displayName != null && displayName.isNotEmpty && _companyNameController.text.trim().isEmpty) {
                                _companyNameController.text = displayName;
                              }
                              if (info.inn != null && info.inn!.isNotEmpty && _innController.text.trim().isEmpty) {
                                _innController.text = info.inn!;
                              }
                              return _buildCompanyInfoCard(info);
                            },
                            error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(textError: errorForUser, repeat: _requestCompanyInfo),
                            orElse: () {
                              final companyName = (profile?.companyName ?? _companyNameController.text).trim();
                              final inn = (profile?.inn ?? _innController.text).trim();
                              final address = _selectedAddress ?? profile?.address;
                              final hasCompanyData = companyName.isNotEmpty || inn.isNotEmpty || (address != null && address.isNotEmpty);
                              if (hasCompanyData) {
                                final info = CompanyShortInfo(
                                  name: companyName.isNotEmpty ? companyName : null,
                                  shortName: companyName.isNotEmpty ? companyName : null,
                                  inn: inn.isNotEmpty ? inn : null,
                                  address: address,
                                );
                                return _buildCompanyInfoCard(info);
                              }
                              return const SizedBox.shrink();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                    Text('Местоположение', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                    const SizedBox(height: 8),
                    LocationPickerWidget(
                      initialLocation: _selectedAddress,
                      onLocationSelected: (locationData) {
                        setState(() {
                          _selectedAddress = locationData['address']?.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    if (_isCompany) ...[
                      Text('Логотип компании', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: _logoPhoto != null
                            ? _buildPhotoItem(_logoPhoto!, isLogo: true, onChanged: () => setSheetState(() {}))
                            : _buildAddPhotoTile(
                                onTap: () async {
                                  await _pickLogoImage();
                                  if (context.mounted) setSheetState(() {});
                                },
                              ),
                      ),
                      const SizedBox(height: 16),
                      Text('Дополнительные фотографии', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _additionalPhotos.length + 1,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            if (index == _additionalPhotos.length) {
                              return SizedBox(
                                width: 120,
                                child: _buildAddPhotoTile(
                                  onTap: () async {
                                    await _pickAdditionalImages();
                                    if (context.mounted) setSheetState(() {});
                                  },
                                ),
                              );
                            }
                            return SizedBox(width: 120, child: _buildPhotoItem(_additionalPhotos[index], isLogo: false, onChanged: () => setSheetState(() {})));
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    CustomTextField(
                      controller: _contactNameController,
                      labelText: 'ФИО *',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите ФИО';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _contactPositionController,
                      labelText: 'Должность *',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите должность';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _contactPhoneController,
                      labelText: 'Телефон *',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('+7 ', style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      inputFormatters: [Mask.generic(masks: ['(###) ###-##-##'])],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите телефон';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _contactPhoneAltController,
                      labelText: 'Дополнительный телефон',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('+7 ', style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      inputFormatters: [Mask.generic(masks: ['(###) ###-##-##'])],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(controller: _contactTelegramController, labelText: 'Telegram'),
                    const SizedBox(height: 16),
                    CustomTextField(controller: _contactWhatsappController, labelText: 'WhatsApp'),
                    const SizedBox(height: 16),
                    CustomTextField(controller: _contactMaxController, labelText: 'MAX'),
                    const SizedBox(height: 16),
                    CustomTextField(controller: _contactEmailController, labelText: 'Email', keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 16),
                    CustomTextField(controller: _contactSiteController, labelText: 'Сайт', keyboardType: TextInputType.url),
                    const SizedBox(height: 16),
                    CustomButton(
                      title: isEditing ? 'Сохранить' : 'Создать',
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: AppColors.primary100p,
                      backgroundColor: AppColors.primary100p,
                      onPressed: () async {
                        if (!_contactFormKey.currentState!.validate()) return;
                        if (_isCompany && _companyNameController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Получите данные по ИНН, чтобы заполнить компанию'), backgroundColor: Colors.red));
                          return;
                        }
                        final hadOldLogo = profile?.logoUrl?.isNotEmpty == true;
                        String? logoUrl;
                        XFile? logoFile;
                        if (_logoPhoto != null && _logoPhoto!.isNew) {
                          logoFile = _logoPhoto!.file;
                        } else if (_logoPhoto != null && _logoPhoto!.url?.isNotEmpty == true) {
                          logoUrl = _logoPhoto!.url;
                        } else if (hadOldLogo) {
                          logoUrl = '';
                        }

                        final existingAdditionalUrls = _additionalPhotos.where((photo) => !photo.isNew && photo.url != null && photo.url!.isNotEmpty).map((photo) => photo.url!).toList();
                        final newAdditionalFiles = _additionalPhotos.where((photo) => photo.isNew && photo.file != null).map((photo) => photo.file!).toList();

                        final created = isEditing
                            ? await _contactProfilesCubit.updateProfile(
                                id: profile.id,
                                isPrivate: !_isCompany,
                                companyName: _isCompany ? _companyNameController.text.trim() : null,
                                inn: _isCompany && _innController.text.trim().isNotEmpty ? _innController.text.trim() : null,
                                address: _selectedAddress?.trim().isNotEmpty == true ? _selectedAddress?.trim() : null,
                                logoUrl: logoUrl,
                                additionalImageUrls: existingAdditionalUrls,
                                contactName: _contactNameController.text.trim(),
                                contactPosition: _contactPositionController.text.trim(),
                                contactPhone: phoneFromMaskedInput(_contactPhoneController.text.trim()),
                                contactPhoneAlt: phoneFromMaskedInput(_contactPhoneAltController.text.trim()).isNotEmpty ? phoneFromMaskedInput(_contactPhoneAltController.text.trim()) : null,
                                contactTelegram: _contactTelegramController.text.trim().isNotEmpty ? _contactTelegramController.text.trim() : null,
                                contactWhatsapp: _contactWhatsappController.text.trim().isNotEmpty ? _contactWhatsappController.text.trim() : null,
                                contactMax: _contactMaxController.text.trim().isNotEmpty ? _contactMaxController.text.trim() : null,
                                contactEmail: _contactEmailController.text.trim().isNotEmpty ? _contactEmailController.text.trim() : null,
                                contactSite: _contactSiteController.text.trim().isNotEmpty ? _contactSiteController.text.trim() : null,
                              )
                            : await _contactProfilesCubit.createProfile(
                                isPrivate: !_isCompany,
                                companyName: _isCompany ? _companyNameController.text.trim() : null,
                                inn: _isCompany && _innController.text.trim().isNotEmpty ? _innController.text.trim() : null,
                                address: _selectedAddress?.trim().isNotEmpty == true ? _selectedAddress?.trim() : null,
                                logoUrl: logoUrl,
                                additionalImageUrls: existingAdditionalUrls,
                                contactName: _contactNameController.text.trim(),
                                contactPosition: _contactPositionController.text.trim(),
                                contactPhone: phoneFromMaskedInput(_contactPhoneController.text.trim()),
                                contactPhoneAlt: phoneFromMaskedInput(_contactPhoneAltController.text.trim()).isNotEmpty ? phoneFromMaskedInput(_contactPhoneAltController.text.trim()) : null,
                                contactTelegram: _contactTelegramController.text.trim().isNotEmpty ? _contactTelegramController.text.trim() : null,
                                contactWhatsapp: _contactWhatsappController.text.trim().isNotEmpty ? _contactWhatsappController.text.trim() : null,
                                contactMax: _contactMaxController.text.trim().isNotEmpty ? _contactMaxController.text.trim() : null,
                                contactEmail: _contactEmailController.text.trim().isNotEmpty ? _contactEmailController.text.trim() : null,
                                contactSite: _contactSiteController.text.trim().isNotEmpty ? _contactSiteController.text.trim() : null,
                              );
                        if (!mounted) return;
                        if (created != null) {
                          if (logoFile != null) {
                            await _contactProfilesCubit.uploadLogo(created.id, logoFile);
                          }
                          if (newAdditionalFiles.isNotEmpty) {
                            await _contactProfilesCubit.uploadAdditionalImages(created.id, newAdditionalFiles);
                          }
                          await _contactProfilesCubit.fetch();
                          setState(() {
                            _selectedContactProfileId = created.id;
                          });
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContactProfileCard(JobContactProfileEntity profile) {
    final title = profile.isPrivate ? 'Частное лицо' : (profile.companyName ?? 'Компания');
    final subtitle = '${profile.contactName} • ${profile.contactPosition}';
    return InkWell(
      onTap: () {
        setState(() {
          _selectedContactProfileId = profile.id;
          _isCompany = !profile.isPrivate;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _selectedContactProfileId == profile.id ? AppColors.primary100p : const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Radio<int>(
              value: profile.id,
              groupValue: _selectedContactProfileId,
              onChanged: (_) {
                setState(() {
                  _selectedContactProfileId = profile.id;
                  _isCompany = !profile.isPrivate;
                });
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _openContactProfileSheet(profile: profile),
              icon: const Icon(Icons.edit_outlined, size: 20, color: AppColors.primary100p),
              tooltip: 'Редактировать контакты',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            ),
          ],
        ),
      ),
    );
  }

  void _onCompanyChanged(bool value) {
    setState(() {
      _isCompany = value;
      if (!_isCompany) {
        _innController.clear();
        _lastInnLookup = null;
        _checkoCubit.reset();
        _logoPhoto = null;
        _additionalPhotos.clear();
      }
    });
  }

  Widget _buildCompanyInfoCard(CompanyShortInfo info) {
    if (info.isEmpty) {
      return const SizedBox.shrink();
    }

    final displayName = info.shortName ?? info.name;
    final fields = <MapEntry<String, String>>[
      if (displayName != null) MapEntry('Название', displayName),
      if (info.status != null) MapEntry('Статус', info.status!),
      if (info.address != null) MapEntry('Адрес', info.address!),
      if (info.ogrn != null) MapEntry('ОГРН/ОГРНИП', info.ogrn!),
      if (info.kpp != null) MapEntry('КПП', info.kpp!),
      if (info.inn != null) MapEntry('ИНН', info.inn!),
      if (info.generalDirector != null) MapEntry('Генеральный директор', info.generalDirector!),
      if (info.manager != null) MapEntry('Руководитель', info.manager!),
      if (info.phone != null) MapEntry('Телефон', info.phone!),
      if (info.email != null) MapEntry('Email', info.email!),
      if (info.site != null) MapEntry('Сайт', info.site!),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.strokeForDarkArea),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Краткая информация о компании', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          ...fields.map(
            (field) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(field.key, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                  ),
                  Expanded(
                    child: Text(field.value, style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickLogoImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85, maxWidth: 1920, maxHeight: 1920);
      if (image != null && mounted) {
        Uint8List? bytes;
        if (kIsWeb) {
          bytes = await image.readAsBytes();
        }
        if (mounted) {
          setState(() {
            _logoPhoto = _PhotoItem(file: image, url: null, bytes: bytes, isNew: true);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Не удалось выбрать фотографию: ${e.toString()}'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
      }
    }
  }

  Future<void> _pickAdditionalImages() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);
      if (images != null && images.isNotEmpty && mounted) {
        final List<_PhotoItem> photoItems = [];
        for (final file in images) {
          Uint8List? bytes;
          if (kIsWeb) {
            bytes = await file.readAsBytes();
          }
          photoItems.add(_PhotoItem(file: file, url: null, bytes: bytes, isNew: true));
        }
        if (mounted) {
          setState(() {
            _additionalPhotos.addAll(photoItems);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Не удалось выбрать фотографии: ${e.toString()}'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
      }
    }
  }

  void _deletePhoto(_PhotoItem photoItem, {required bool isLogo}) {
    if (mounted) {
      setState(() {
        if (isLogo) {
          _logoPhoto = null;
        } else {
          _additionalPhotos.remove(photoItem);
        }
      });
    }
  }

  Widget _buildPhotoItem(_PhotoItem photoItem, {required bool isLogo, VoidCallback? onChanged}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: photoItem.isNew
                ? kIsWeb
                      ? photoItem.bytes != null
                            ? Image.memory(
                                photoItem.bytes!,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const ColoredBox(
                                  color: Color(0xFFF3F4F6),
                                  child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                                ),
                              )
                            : const ColoredBox(
                                color: Color(0xFFF3F4F6),
                                child: Center(child: CircularProgressIndicator()),
                              )
                      : Image.file(
                          File(photoItem.file!.path),
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => const ColoredBox(
                            color: Color(0xFFF3F4F6),
                            child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                          ),
                        )
                : photoItem.url != null && photoItem.url!.isNotEmpty
                ? Image.network(
                    getImageUrl(photoItem.url!),
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const ColoredBox(
                        color: Color(0xFFF3F4F6),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const ColoredBox(
                      color: Color(0xFFF3F4F6),
                      child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                    ),
                  )
                : const ColoredBox(
                    color: Color(0xFFF3F4F6),
                    child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                  ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                _deletePhoto(photoItem, isLogo: isLogo);
                onChanged?.call();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: const Icon(Icons.close, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoTile({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, size: 32, color: Color(0xFF9CA5AF)),
            const SizedBox(height: 8),
            Text('Ещё', style: AppStyles.regular12s.copyWith(color: const Color(0xFF9CA5AF))),
          ],
        ),
      ),
    );
  }

  void _addSkill() {
    final value = _skillsController.text.trim();
    if (value.isEmpty) return;
    setState(() {
      if (!_skills.contains(value)) {
        _skills.add(value);
      }
      _skillsController.clear();
    });
  }

  void _removeSkill(String value) {
    setState(() {
      _skills.remove(value);
    });
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(controller: _skillsController, labelText: 'Ключевые навыки'),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: _addSkill,
              icon: const Icon(Icons.add_circle, color: AppColors.primary100p),
              tooltip: 'Добавить навык',
            ),
          ],
        ),
        if (_skills.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _skills.map((skill) => Chip(label: Text(skill), onDeleted: () => _removeSkill(skill))).toList(),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobVacancyEditBloc>.value(value: _bloc),
        BlocProvider<CheckoCompanyCubit>.value(value: _checkoCubit),
        BlocProvider<ContactProfilesCubit>.value(value: _contactProfilesCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<JobVacancyEditBloc, JobVacancyEditState>(
            listener: (context, state) {
              state.maybeWhen(
                created: (vacancy) {
                  getIt<JobsVacanciesRefreshCubit>().notify();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Вакансия создана и отправлена на модерацию'), backgroundColor: Colors.green));
                  context.router.maybePop(true);
                },
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Создать вакансию', withBack: true),
          backgroundColor: AppColors.background,
          body: BlocBuilder<JobVacancyEditBloc, JobVacancyEditState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(creating: () => true, orElse: () => false);

              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: _titleController,
                            labelText: 'Заголовок вакансии *',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Введите заголовок';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(controller: _salaryFromController, labelText: 'Зарплата от', keyboardType: TextInputType.number),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: CustomTextField(controller: _salaryToController, labelText: 'Зарплата до', keyboardType: TextInputType.number),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: _currency,
                                  decoration: InputDecoration(
                                    labelText: 'Валюта',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: AppColors.primary100p, width: 2),
                                    ),
                                    labelStyle: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                                  ),
                                  items: const [
                                    DropdownMenuItem(value: 'RUB', child: Text('RUB')),
                                    DropdownMenuItem(value: 'USD', child: Text('USD')),
                                    DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                                  ],
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        _currency = value;
                                      });
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: CheckboxListTile(
                                  value: _isGross,
                                  onChanged: (value) {
                                    setState(() {
                                      _isGross = value ?? true;
                                    });
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  title: Text('До вычета налогов', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(controller: _employmentFormController, labelText: 'Оформление'),
                          const SizedBox(height: 16),
                          const SizedBox(height: 16),
                          _buildSelectRow(label: 'Тип занятости', value: _employmentType != null ? _mapEmploymentType(_employmentType!) : 'Не выбрано', onTap: () => _openEmploymentTypeSheet(context)),
                          const SizedBox(height: 12),
                          _buildSelectRow(label: 'График', value: _schedule != null ? _mapSchedule(_schedule!) : 'Не выбрано', onTap: () => _openScheduleSheet(context)),
                          const SizedBox(height: 16),
                          CustomTextField(controller: _workHoursController, labelText: 'Рабочие часы'),
                          const SizedBox(height: 16),
                          _buildSelectRow(label: 'Опыт', value: _experienceLevel != null ? _mapExperience(_experienceLevel!) : 'Не выбрано', onTap: () => _openExperienceSheet(context)),
                          const SizedBox(height: 12),
                          CustomTextField(controller: _descriptionController, labelText: 'Описание вакансии', maxLines: 4),
                          const SizedBox(height: 16),
                          CustomTextField(controller: _responsibilitiesController, labelText: 'Обязанности', maxLines: 4),
                          const SizedBox(height: 16),
                          CustomTextField(controller: _requirementsController, labelText: 'Требования', maxLines: 4),
                          const SizedBox(height: 16),
                          _buildSkillsSection(),
                          const SizedBox(height: 16),
                          CustomTextField(controller: _conditionsController, labelText: 'Условия', maxLines: 4),
                          const SizedBox(height: 16),
                          SwitchListTile(
                            value: _relocationAllowed,
                            onChanged: (value) {
                              setState(() {
                                _relocationAllowed = value;
                              });
                            },
                            title: const Text('Компания готова к релокации сотрудника'),
                          ),
                          const SizedBox(height: 16),
                          Center(child: Text(_isCompany ? 'Вы размещаете вакансию от лица компании' : 'Вы размещаете вакансию от физ лица', style: AppStyles.regular18s)),

                          SwitchListTile(value: _isCompany, onChanged: _onCompanyChanged, title: const Text('Компания'), contentPadding: EdgeInsets.zero),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Контактные данные', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                              ),
                              TextButton(onPressed: () => _openContactProfileSheet(), child: const Text('Добавить')),
                            ],
                          ),
                          BlocBuilder<ContactProfilesCubit, ContactProfilesState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () => const LoadingCustom(paddingTop: 0),
                                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(textError: errorForUser, repeat: _contactProfilesCubit.fetch),
                                success: (profiles) {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    _selectDefaultProfile(profiles);
                                  });
                                  if (profiles.isEmpty) {
                                    return Text('Нет сохранённых профилей. Создайте контактные данные.', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary));
                                  }
                                  return Column(
                                    children: profiles.map((profile) => Padding(padding: const EdgeInsets.only(bottom: 8), child: _buildContactProfileCard(profile))).toList(),
                                  );
                                },
                                orElse: () => const SizedBox.shrink(),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          CustomButton(
                            title: 'Сохранить вакансию',
                            textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                            borderColor: AppColors.primary100p,
                            backgroundColor: AppColors.primary100p,
                            onPressed: isLoading ? null : _submit,
                            disabled: isLoading,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  if (isLoading)
                    const Positioned.fill(
                      child: ColoredBox(
                        color: Color.fromARGB(80, 0, 0, 0),
                        child: Center(child: LoadingCustom()),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSelectRow({required String label, required String value, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(value, style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  void _openEmploymentTypeSheet(BuildContext context) {
    showUniversalBottomSheet<void>(
      context: context,
      title: 'Тип занятости',
      useRootNavigator: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Полная занятость'),
            onTap: () {
              setState(() => _employmentType = 'full_time');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Частичная занятость'),
            onTap: () {
              setState(() => _employmentType = 'part_time');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Проектная работа'),
            onTap: () {
              setState(() => _employmentType = 'project');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Стажировка'),
            onTap: () {
              setState(() => _employmentType = 'internship');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _openScheduleSheet(BuildContext context) {
    showUniversalBottomSheet<void>(
      context: context,
      title: 'График',
      useRootNavigator: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Офис'),
            onTap: () {
              setState(() => _schedule = 'office');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Удалённо'),
            onTap: () {
              setState(() => _schedule = 'remote');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Гибрид'),
            onTap: () {
              setState(() => _schedule = 'hybrid');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Сменный график'),
            onTap: () {
              setState(() => _schedule = 'shift');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Вахта'),
            onTap: () {
              setState(() => _schedule = 'fly_in_fly_out');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _openExperienceSheet(BuildContext context) {
    showUniversalBottomSheet<void>(
      context: context,
      title: 'Опыт',
      useRootNavigator: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Без опыта'),
            onTap: () {
              setState(() => _experienceLevel = 'no_experience');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('1–3 года'),
            onTap: () {
              setState(() => _experienceLevel = '1_3');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('3–6 лет'),
            onTap: () {
              setState(() => _experienceLevel = '3_6');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('6+ лет'),
            onTap: () {
              setState(() => _experienceLevel = '6_plus');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
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
        return '1–3 года';
      case '3_6':
        return '3–6 лет';
      case '6_plus':
        return '6+ лет';
      default:
        return value;
    }
  }
}

class _PhotoItem {
  final XFile? file;
  final String? url;
  final Uint8List? bytes;
  final bool isNew;

  _PhotoItem({this.file, this.url, this.bytes, required this.isNew}) : assert((url != null && !isNew) || (file != null && isNew), 'Either url or file must be provided');
}