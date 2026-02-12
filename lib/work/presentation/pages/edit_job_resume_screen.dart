import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:mask/mask/mask.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aviapoint/work/domain/entities/job_contact_profile_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_experience_entity.dart';
import 'package:aviapoint/work/domain/entities/job_resume_education_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/contact_profiles_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/job_resume_detail_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/job_resume_edit_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditJobResumeScreen extends StatefulWidget {
  final int id;

  const EditJobResumeScreen({super.key, @PathParam('id') required this.id});

  @override
  State<EditJobResumeScreen> createState() => _EditJobResumeScreenState();
}

class _EditJobResumeScreenState extends State<EditJobResumeScreen> {
  static const XTypeGroup _resumeFilesTypeGroup = XTypeGroup(
    label: 'Изображения, PDF, Word, Excel',
    extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'pdf', 'doc', 'docx', 'xls', 'xlsx'],
    uniformTypeIdentifiers: [
      'public.jpeg', 'public.png', 'public.gif', 'public.webp', 'public.image', 'com.adobe.pdf',
      'com.microsoft.word.doc', 'org.openxmlformats.wordprocessingml.document',
      'com.microsoft.excel.xls', 'org.openxmlformats.spreadsheetml.sheet',
    ],
  );

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _aboutController;
  late final TextEditingController _salaryController;
  late final TextEditingController _addressController;
  late final TextEditingController _dateOfBirthController;
  late final TextEditingController _flightHoursTotalController;
  late final TextEditingController _flightHoursPicController;
  late final TextEditingController _licensesController;
  late final TextEditingController _typeRatingsController;
  late final TextEditingController _medicalClassController;

  String _currency = 'RUB';
  bool _readyToRelocate = false;
  bool _readyForBusinessTrips = false;
  int? _contactProfileId;
  bool _contactProfileIdCleared = false;
  List<String> _citizenship = ['RU'];
  bool _workPermit = true;
  bool _isVisibleForEmployers = true;
  JobResumeEntity? _currentResume;
  bool _uploadingPhoto = false;
  List<JobResumeExperienceEntity> _experiences = [];
  List<JobResumeEducationEntity> _educations = [];
  String? _selectedAddress;

  final Set<String> _employmentTypes = {};
  final Set<String> _schedules = {};

  late final JobResumeDetailBloc _detailBloc;
  late final JobResumeEditBloc _editBloc;
  late final ContactProfilesCubit _contactProfilesCubit;

  @override
  void initState() {
    super.initState();
    _detailBloc = JobResumeDetailBloc(repository: getIt<JobsRepository>())
      ..add(JobResumeDetailEvent.getById(id: widget.id));
    _editBloc = JobResumeEditBloc(repository: getIt<JobsRepository>());
    _contactProfilesCubit = ContactProfilesCubit(repository: getIt<JobsRepository>())..fetch();

    _titleController = TextEditingController();
    _aboutController = TextEditingController();
    _salaryController = TextEditingController();
    _addressController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _flightHoursTotalController = TextEditingController();
    _flightHoursPicController = TextEditingController();
    _licensesController = TextEditingController();
    _typeRatingsController = TextEditingController();
    _medicalClassController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _aboutController.dispose();
    _salaryController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    _flightHoursTotalController.dispose();
    _flightHoursPicController.dispose();
    _licensesController.dispose();
    _typeRatingsController.dispose();
    _medicalClassController.dispose();
    _detailBloc.close();
    _editBloc.close();
    _contactProfilesCubit.close();
    super.dispose();
  }

  void _fillFromResume(JobResumeEntity r) {
    _titleController.text = r.title;
    _aboutController.text = r.about ?? '';
    _salaryController.text = r.desiredSalary?.toString() ?? '';
    _addressController.text = r.address ?? '';
    _selectedAddress = r.address;
    _dateOfBirthController.text = r.dateOfBirth ?? '';
    _citizenship = (r.citizenship != null && r.citizenship!.isNotEmpty) ? List.from(r.citizenship!) : ['RU'];
    _workPermit = r.workPermit ?? true;
    _isVisibleForEmployers = r.isVisibleForEmployers;
    _contactProfileId = r.contactProfileId;
    _contactProfileIdCleared = false;
    _flightHoursTotalController.text = r.flightHoursTotal?.toString() ?? '';
    _flightHoursPicController.text = r.flightHoursPic?.toString() ?? '';
    _licensesController.text = r.licenses ?? '';
    _typeRatingsController.text = r.typeRatings ?? '';
    _medicalClassController.text = r.medicalClass ?? '';
    _currency = r.currency ?? 'RUB';
    _readyToRelocate = r.readyToRelocate ?? false;
    _readyForBusinessTrips = r.readyForBusinessTrips ?? false;

    _employmentTypes
      ..clear()
      ..addAll(_splitCsv(r.employmentTypes));
    _schedules
      ..clear()
      ..addAll(_splitCsv(r.schedules));
  }

  Iterable<String> _splitCsv(String? value) {
    if (value == null || value.isEmpty) return const [];
    return value.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
  }

  Future<void> _loadExperiencesAndEducations() async {
    final repo = getIt<JobsRepository>();
    final expResult = await repo.getResumeExperiences(widget.id);
    final eduResult = await repo.getResumeEducations(widget.id);
    if (!mounted) return;
    expResult.fold((_) => null, (list) => setState(() => _experiences = list));
    eduResult.fold((_) => null, (list) => setState(() => _educations = list));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_contactProfileId == null && !_contactProfileIdCleared) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите контактный профиль для работодателей'), backgroundColor: Colors.red),
      );
      return;
    }

    final desiredSalary = _salaryController.text.trim().isNotEmpty ? int.parse(_salaryController.text.trim()) : null;
    final flightHoursTotal = _flightHoursTotalController.text.trim().isNotEmpty
        ? int.parse(_flightHoursTotalController.text.trim())
        : null;
    final flightHoursPic = _flightHoursPicController.text.trim().isNotEmpty
        ? int.parse(_flightHoursPicController.text.trim())
        : null;
    final addressValue = (_selectedAddress ?? _addressController.text.trim()).trim();

    _editBloc.add(
      JobResumeEditEvent.update(
        id: widget.id,
        title: _titleController.text.trim(),
        about: _aboutController.text.trim().isNotEmpty ? _aboutController.text.trim() : null,
        desiredSalary: desiredSalary,
        currency: _currency,
        employmentTypes: _employmentTypes.isNotEmpty ? _employmentTypes.join(',') : null,
        schedules: _schedules.isNotEmpty ? _schedules.join(',') : null,
        readyToRelocate: _readyToRelocate,
        readyForBusinessTrips: _readyForBusinessTrips,
        address: addressValue.isNotEmpty ? addressValue : null,
        dateOfBirth: _dateOfBirthController.text.trim().isNotEmpty ? _dateOfBirthController.text.trim() : null,
        citizenship: _citizenship.isEmpty ? null : _citizenship,
        workPermit: _workPermit,
        contactProfileId: _contactProfileId,
        clearContactProfileId: _contactProfileIdCleared,
        currentPosition: null,
        currentCompany: null,
        totalExperienceMonths: null,
        flightHoursTotal: flightHoursTotal,
        flightHoursPic: flightHoursPic,
        licenses: _licensesController.text.trim().isNotEmpty ? _licensesController.text.trim() : null,
        typeRatings: _typeRatingsController.text.trim().isNotEmpty ? _typeRatingsController.text.trim() : null,
        medicalClass: _medicalClassController.text.trim().isNotEmpty ? _medicalClassController.text.trim() : null,
        isVisibleForEmployers: _isVisibleForEmployers,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobResumeDetailBloc>.value(value: _detailBloc),
        BlocProvider<JobResumeEditBloc>.value(value: _editBloc),
        BlocProvider<ContactProfilesCubit>.value(value: _contactProfilesCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<JobResumeDetailBloc, JobResumeDetailState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (resume) {
                  setState(() => _currentResume = resume);
                  _fillFromResume(resume);
                  _loadExperiencesAndEducations();
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<JobResumeEditBloc, JobResumeEditState>(
            listener: (context, state) {
              state.maybeWhen(
                updated: (resume) {
                  getIt<JobsResumesRefreshCubit>().notify();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Резюме обновлено'), backgroundColor: Colors.green));
                  context.router.maybePop();
                },
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Редактировать резюме', withBack: true),
          backgroundColor: AppColors.background,
          body: BlocBuilder<JobResumeDetailBloc, JobResumeDetailState>(
            builder: (context, detailState) {
              final isLoadingDetail = detailState.maybeWhen(loading: () => true, orElse: () => false);

              return BlocBuilder<JobResumeEditBloc, JobResumeEditState>(
                builder: (context, editState) {
                  final isSaving = editState.maybeWhen(updating: () => true, orElse: () => false);

                  final showOverlay = isLoadingDetail || isSaving;

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
                                labelText: 'Заголовок резюме *',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Введите заголовок';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(controller: _aboutController, labelText: 'О себе', maxLines: 4),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: _salaryController,
                                      labelText: 'Желаемая зарплата',
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      validator: (v) {
                                        final s = v?.trim() ?? '';
                                        if (s.isEmpty) return null;
                                        final n = int.tryParse(s);
                                        if (n == null || n < 0) return 'Введите число';
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      value: _currency,
                                      decoration: const InputDecoration(
                                        labelText: 'Валюта',
                                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text('Место проживания', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                              const SizedBox(height: 8),
                              LocationPickerWidget(
                                initialLocation: _selectedAddress ?? (_addressController.text.trim().isNotEmpty ? _addressController.text.trim() : null),
                                onLocationSelected: (locationData) {
                                  setState(() {
                                    _selectedAddress = locationData['address']?.toString();
                                    if (_selectedAddress != null) _addressController.text = _selectedAddress!;
                                  });
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: _dateOfBirthController,
                                labelText: 'Дата рождения',
                                hintText: 'ГГГГ-ММ-ДД',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.calendar_today, color: AppColors.textSecondary),
                                  onPressed: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
                                      firstDate: DateTime(1920),
                                      lastDate: DateTime.now(),
                                    );
                                    if (date != null && mounted) {
                                      setState(() {
                                        _dateOfBirthController.text =
                                            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                      });
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildCitizenshipSelector(),
                              const SizedBox(height: 16),
                              SwitchListTile(
                                value: _workPermit,
                                onChanged: (value) => setState(() => _workPermit = value),
                                title: const Text('Разрешение на работу в РФ'),
                              ),
                              const SizedBox(height: 8),
                              SwitchListTile(
                                value: _isVisibleForEmployers,
                                onChanged: (value) => setState(() => _isVisibleForEmployers = value),
                                title: const Text('Показывать работодателям (опубликовано)'),
                                activeColor: AppColors.primary100p,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text('Контактный профиль для работодателей *', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                                  ),
                                  TextButton(onPressed: () => _openContactProfileSheet(), child: const Text('Добавить')),
                                ],
                              ),
                              BlocBuilder<ContactProfilesCubit, ContactProfilesState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    loading: () => const LoadingCustom(paddingTop: 0),
                                    error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) =>
                                        ErrorCustom(textError: errorForUser, repeat: _contactProfilesCubit.fetch),
                                    success: (profiles) {
                                      if (profiles.isEmpty) {
                                        return Text(
                                          'Нет сохранённых профилей. Создайте контактные данные.',
                                          style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: _buildContactProfileCardClear(),
                                          ),
                                          ...profiles.map((profile) => Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: _buildContactProfileCard(profile),
                                              )),
                                        ],
                                      );
                                    },
                                    orElse: () => const SizedBox.shrink(),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              _buildPhotoSection(),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: _flightHoursTotalController,
                                      labelText: 'Налёт всего (часы)',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: _flightHoursPicController,
                                      labelText: 'Налёт PIC (часы)',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(controller: _licensesController, labelText: 'Лицензии (через запятую)'),
                              const SizedBox(height: 16),
                              CustomTextField(controller: _typeRatingsController, labelText: 'Типы ВС (через запятую)'),
                              const SizedBox(height: 16),
                              CustomTextField(controller: _medicalClassController, labelText: 'Медицинский допуск'),
                              const SizedBox(height: 16),
                              _buildMultiSelectRow(
                                label: 'Тип занятости',
                                values: _employmentTypes,
                                allOptions: const {
                                  'full_time': 'Полная занятость',
                                  'part_time': 'Частичная занятость',
                                  'project': 'Проектная работа',
                                  'internship': 'Стажировка',
                                },
                                onChanged: (set) {
                                  setState(() {
                                    _employmentTypes
                                      ..clear()
                                      ..addAll(set);
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                              _buildMultiSelectRow(
                                label: 'График работы',
                                values: _schedules,
                                allOptions: const {
                                  'office': 'Офис',
                                  'remote': 'Удалённо',
                                  'hybrid': 'Гибрид',
                                  'shift': 'Сменный график',
                                  'fly_in_fly_out': 'Вахта',
                                },
                                onChanged: (set) {
                                  setState(() {
                                    _schedules
                                      ..clear()
                                      ..addAll(set);
                                  });
                                },
                              ),
                              const SizedBox(height: 16),
                              SwitchListTile(
                                value: _readyToRelocate,
                                onChanged: (value) {
                                  setState(() {
                                    _readyToRelocate = value;
                                  });
                                },
                                title: const Text('Готов к переезду'),
                              ),
                              SwitchListTile(
                                value: _readyForBusinessTrips,
                                onChanged: (value) {
                                  setState(() {
                                    _readyForBusinessTrips = value;
                                  });
                                },
                                title: const Text('Готов к командировкам'),
                              ),
                              const SizedBox(height: 24),
                              Text('Опыт работы', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                              const SizedBox(height: 8),
                              ..._experiences.map(
                                (e) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    title: Text(e.companyName, style: AppStyles.bold14s),
                                    subtitle: Text(
                                      () {
                                        final start = formatDateToDisplay(e.startDate);
                                        final end = e.isCurrent == true ? 'по н.в.' : formatDateToDisplay(e.endDate);
                                        return [start, end].where((s) => s.isNotEmpty).join(' — ');
                                      }(),
                                      style: AppStyles.regular12s,
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit_outlined, size: 22, color: AppColors.primary100p),
                                          onPressed: () => _showExperienceSheet(experience: e),
                                          tooltip: 'Редактировать',
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                                          onPressed: () async {
                                        final ok = await showDialog<bool>(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text('Удалить?'),
                                            content: const Text('Удалить запись об опыте работы?'),
                                            actions: [
                                              TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Нет')),
                                              TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Да')),
                                            ],
                                          ),
                                        );
                                        if (ok == true && mounted) {
                                          await getIt<JobsRepository>().deleteResumeExperience(resumeId: widget.id, experienceId: e.id);
                                          if (mounted) _loadExperiencesAndEducations();
                                        }
                                      },
                                          tooltip: 'Удалить',
                                        ),
                                      ],
                                    ),
                                    onTap: () => _showExperienceSheet(experience: e),
                                  ),
                                ),
                              ),
                              OutlinedButton.icon(
                                icon: const Icon(Icons.add),
                                label: const Text('Добавить место работы'),
                                onPressed: () => _showExperienceSheet(),
                              ),
                              const SizedBox(height: 24),
                              Text('Образование', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                              const SizedBox(height: 8),
                              ..._educations.map(
                                (e) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    title: Text(e.institution, style: AppStyles.bold14s),
                                    subtitle: Text(
                                      '${e.speciality ?? ''} ${e.yearStart != null || e.yearEnd != null ? '${formatYearToDisplay(e.yearStart)} — ${e.isCurrent == true ? 'по н.в.' : formatYearToDisplay(e.yearEnd)}' : ''}'.trim(),
                                      style: AppStyles.regular12s,
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                                      onPressed: () async {
                                        final ok = await showDialog<bool>(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text('Удалить?'),
                                            content: const Text('Удалить запись об образовании?'),
                                            actions: [
                                              TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Нет')),
                                              TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Да')),
                                            ],
                                          ),
                                        );
                                        if (ok == true && mounted) {
                                          await getIt<JobsRepository>().deleteResumeEducation(resumeId: widget.id, educationId: e.id);
                                          if (mounted) _loadExperiencesAndEducations();
                                        }
                                      },
                                    ),
                                    onTap: () => _showEducationSheet(education: e),
                                  ),
                                ),
                              ),
                              OutlinedButton.icon(
                                icon: const Icon(Icons.add),
                                label: const Text('Добавить образование'),
                                onPressed: () => _showEducationSheet(),
                              ),
                              const SizedBox(height: 24),
                              CustomButton(
                                title: 'Сохранить изменения',
                                textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                                borderColor: AppColors.primary100p,
                                backgroundColor: AppColors.primary100p,
                                onPressed: showOverlay ? null : _submit,
                                disabled: showOverlay,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                      if (showOverlay)
                        const Positioned.fill(
                          child: ColoredBox(
                            color: Color.fromARGB(80, 0, 0, 0),
                            child: Center(child: LoadingCustom()),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showExperienceSheet({JobResumeExperienceEntity? experience}) {
    final companyController = TextEditingController(text: experience?.companyName ?? '');
    final responsibilitiesController = TextEditingController(text: experience?.responsibilitiesAndAchievements ?? '');
    final startDateController = TextEditingController(text: experience?.startDate ?? '');
    final endDateController = TextEditingController(text: experience?.endDate ?? '');
    bool isCurrent = experience?.isCurrent ?? false;
    showUniversalBottomSheet<void>(
      context: context,
      title: experience == null ? 'Добавить опыт' : 'Редактировать опыт',
      useRootNavigator: false,
      child: StatefulBuilder(
        builder: (ctx, setModalState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: companyController,
                labelText: 'Компания *',
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите название компании' : null,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: startDateController,
                      labelText: 'Дата начала',
                      hintText: 'ГГГГ-ММ-ДД',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today, color: AppColors.textSecondary),
                        onPressed: () async {
                          final d = await showDatePicker(context: ctx, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
                          if (d != null) { startDateController.text = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}'; setModalState(() {}); }
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: endDateController,
                      labelText: 'Дата окончания',
                      hintText: 'ГГГГ-ММ-ДД',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today, color: AppColors.textSecondary),
                        onPressed: () async {
                          if (isCurrent) return;
                          final d = await showDatePicker(context: ctx, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
                          if (d != null) { endDateController.text = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}'; setModalState(() {}); }
                        },
                      ),
                    ),
                    CheckboxListTile(
                      value: isCurrent,
                      onChanged: (v) { setModalState(() { isCurrent = v ?? false; if (isCurrent) endDateController.clear(); }); },
                      title: const Text('По настоящее время'),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(controller: responsibilitiesController, labelText: 'Обязанности и достижения', maxLines: 4),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена'))),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (companyController.text.trim().isEmpty) return;
                              final repo = getIt<JobsRepository>();
                              final startStr = startDateController.text.trim().isNotEmpty ? startDateController.text.trim() : null;
                              final endStr = endDateController.text.trim().isNotEmpty ? endDateController.text.trim() : null;
                              if (experience == null) {
                                final result = await repo.createResumeExperience(
                                  resumeId: widget.id,
                                  companyName: companyController.text.trim(),
                                  startDate: startStr,
                                  endDate: endStr,
                                  isCurrent: isCurrent,
                                  responsibilitiesAndAchievements: responsibilitiesController.text.trim().isNotEmpty ? responsibilitiesController.text.trim() : null,
                                );
                                result.fold((_) => null, (_) { if (mounted) { Navigator.of(context).pop(); _loadExperiencesAndEducations(); } });
                              } else {
                                final result = await repo.updateResumeExperience(
                                  resumeId: widget.id,
                                  experienceId: experience.id,
                                  companyName: companyController.text.trim(),
                                  startDate: startStr,
                                  endDate: endStr,
                                  isCurrent: isCurrent,
                                  responsibilitiesAndAchievements: responsibilitiesController.text.trim().isNotEmpty ? responsibilitiesController.text.trim() : null,
                                );
                                result.fold((_) => null, (_) { if (mounted) { Navigator.of(context).pop(); _loadExperiencesAndEducations(); } });
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
                            child: const Text('Сохранить'),
                          ),
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }

  void _showEducationSheet({JobResumeEducationEntity? education}) {
    final institutionController = TextEditingController(text: education?.institution ?? '');
    final specialityController = TextEditingController(text: education?.speciality ?? '');
    final yearStartController = TextEditingController(text: education?.yearStart?.toString() ?? '');
    final yearEndController = TextEditingController(text: education?.yearEnd?.toString() ?? '');
    bool isCurrent = education?.isCurrent ?? false;
    showUniversalBottomSheet<void>(
      context: context,
      title: education == null ? 'Добавить образование' : 'Редактировать образование',
      useRootNavigator: false,
      child: StatefulBuilder(
        builder: (ctx, setModalState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: institutionController,
                labelText: 'Учебное заведение *',
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите название' : null,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(controller: specialityController, labelText: 'Специализация'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: yearStartController,
                            labelText: 'Год начала',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CustomTextField(
                            controller: yearEndController,
                            labelText: 'Год окончания',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    CheckboxListTile(
                      value: isCurrent,
                      onChanged: (v) => setModalState(() { isCurrent = v ?? false; if (isCurrent) yearEndController.clear(); }),
                      title: const Text('По настоящее время'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена'))),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (institutionController.text.trim().isEmpty) return;
                              final repo = getIt<JobsRepository>();
                              final yStart = int.tryParse(yearStartController.text.trim());
                              final yEnd = int.tryParse(yearEndController.text.trim());
                              if (education == null) {
                                final result = await repo.createResumeEducation(
                                  resumeId: widget.id,
                                  institution: institutionController.text.trim(),
                                  speciality: specialityController.text.trim().isNotEmpty ? specialityController.text.trim() : null,
                                  yearStart: yStart,
                                  yearEnd: yEnd,
                                  isCurrent: isCurrent,
                                );
                                result.fold((_) => null, (_) { if (mounted) { Navigator.of(context).pop(); _loadExperiencesAndEducations(); } });
                              } else {
                                final result = await repo.updateResumeEducation(
                                  resumeId: widget.id,
                                  educationId: education.id,
                                  institution: institutionController.text.trim(),
                                  speciality: specialityController.text.trim().isNotEmpty ? specialityController.text.trim() : null,
                                  yearStart: yStart,
                                  yearEnd: yEnd,
                                  isCurrent: isCurrent,
                                );
                                result.fold((_) => null, (_) { if (mounted) { Navigator.of(context).pop(); _loadExperiencesAndEducations(); } });
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
                            child: const Text('Сохранить'),
                          ),
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPhotoSection() {
    final resume = _currentResume;
    final mainPhotoUrl = resume?.photoUrl;
    final additionalUrls = resume?.additionalPhotoUrls ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ваше фото *', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          width: double.infinity,
          child: InkWell(
            onTap: _uploadingPhoto
                ? null
                : () async {
                    final picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 85,
                      maxWidth: 1920,
                      maxHeight: 1920,
                    );
                    if (image == null || !mounted) return;
                    setState(() => _uploadingPhoto = true);
                    final result = await getIt<JobsRepository>().uploadResumePhoto(widget.id, image);
                    if (mounted) setState(() => _uploadingPhoto = false);
                    result.fold(
                      (failure) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(failure.message ?? 'Ошибка загрузки'), backgroundColor: Colors.red),
                          );
                        }
                      },
                      (_) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Фото загружено'), backgroundColor: Colors.green),
                          );
                          _detailBloc.add(JobResumeDetailEvent.getById(id: widget.id));
                        }
                      },
                    );
                  },
            borderRadius: BorderRadius.circular(12),
            child: mainPhotoUrl != null && mainPhotoUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        NetworkImageWidget(
                          imageUrl: getImageUrl(mainPhotoUrl),
                          fit: BoxFit.cover,
                          errorWidget: const ColoredBox(
                            color: AppColors.strokeForDarkArea,
                            child: Icon(Icons.person, size: 40),
                          ),
                        ),
                        if (_uploadingPhoto)
                          const ColoredBox(
                            color: Color(0x80000000),
                            child: Center(child: CircularProgressIndicator(color: Colors.white)),
                          )
                        else
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('Нажмите, чтобы изменить', style: AppStyles.regular12s.copyWith(color: Colors.white)),
                            ),
                          ),
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: _uploadingPhoto
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_a_photo, size: 40, color: Color(0xFF9CA5AF)),
                              const SizedBox(height: 8),
                              Text('Нажмите, чтобы добавить фото', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                            ],
                          ),
                  ),
          ),
        ),
        if (additionalUrls.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text('Прикреплённые файлы (грамоты, сертификаты, дипломы, лицензии)', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: additionalUrls.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final url = additionalUrls[index];
                final lower = url.toLowerCase();
                final isPdf = lower.endsWith('.pdf');
                final isWord = lower.endsWith('.doc') || lower.endsWith('.docx');
                final isExcel = lower.endsWith('.xls') || lower.endsWith('.xlsx');
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: isPdf
                            ? Container(
                                color: AppColors.strokeForDarkArea,
                                child: const Center(child: Icon(Icons.picture_as_pdf, size: 36, color: Colors.red)),
                              )
                            : isWord
                                ? Container(
                                    color: AppColors.strokeForDarkArea,
                                    child: const Center(child: Icon(Icons.description, size: 36, color: Colors.blue)),
                                  )
                                : isExcel
                                    ? Container(
                                        color: AppColors.strokeForDarkArea,
                                        child: const Center(child: Icon(Icons.table_chart, size: 36, color: Colors.green)),
                                      )
                                    : NetworkImageWidget(
                                        imageUrl: getImageUrl(url),
                                        fit: BoxFit.cover,
                                        errorWidget: const Icon(Icons.image_not_supported),
                                      ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                        padding: const EdgeInsets.all(4),
                        minimumSize: const Size(24, 24),
                      ),
                      onPressed: _uploadingPhoto
                          ? null
                          : () => _removeAttachedFile(index),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _uploadingPhoto
              ? null
              : () async {
                  final xFiles = await openFiles(
                    acceptedTypeGroups: const [_resumeFilesTypeGroup],
                  );
                  if (xFiles.isEmpty || !mounted) return;
                  setState(() => _uploadingPhoto = true);
                  final uploadResult = await getIt<JobsRepository>().uploadResumeAdditionalPhotos(widget.id, xFiles);
                  if (mounted) setState(() => _uploadingPhoto = false);
                  uploadResult.fold(
                    (failure) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(failure.message ?? 'Ошибка загрузки'), backgroundColor: Colors.red),
                        );
                      }
                    },
                    (_) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Файлы добавлены'), backgroundColor: Colors.green),
                        );
                        _detailBloc.add(JobResumeDetailEvent.getById(id: widget.id));
                      }
                    },
                  );
                },
          icon: const Icon(Icons.attach_file),
          label: const Text('Прикрепить файлы (грамоты, сертификаты, дипломы, лицензии)'),
        ),
      ],
    );
  }

  Future<void> _removeAttachedFile(int index) async {
    final resume = _currentResume;
    if (resume == null) return;
    final urls = resume.additionalPhotoUrls ?? [];
    if (index < 0 || index >= urls.length) return;
    final newList = List<String>.from(urls)..removeAt(index);
    setState(() => _uploadingPhoto = true);
    final result = await getIt<JobsRepository>().updateResume(
      id: widget.id,
      additionalPhotoUrls: newList,
    );
    if (!mounted) return;
    setState(() => _uploadingPhoto = false);
    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message ?? 'Не удалось удалить файл'), backgroundColor: Colors.red),
        );
      },
      (updatedResume) {
        setState(() => _currentResume = updatedResume);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Файл удалён'), backgroundColor: Colors.green),
        );
      },
    );
  }

  static const Map<String, String> _countryNames = {
    'RU': 'Россия',
    'BY': 'Беларусь',
    'KZ': 'Казахстан',
    'UA': 'Украина',
    'UZ': 'Узбекистан',
    'OTHER': 'Другое',
  };

  Widget _buildCitizenshipSelector() {
    const label = 'Гражданство';
    final display = _citizenship.isEmpty
        ? 'Не выбрано'
        : _citizenship.map((c) => _countryNames[c] ?? c).join(', ');
    return InkWell(
      onTap: () {
        final selected = List<String>.from(_citizenship);
        showUniversalBottomSheet<void>(
          context: context,
          title: label,
          useRootNavigator: false,
          child: StatefulBuilder(
            builder: (context, setStateModal) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ..._countryNames.entries.map(
                    (e) => CheckboxListTile(
                      value: selected.contains(e.key),
                      onChanged: (checked) {
                        setStateModal(() {
                          if (checked == true) {
                            if (!selected.contains(e.key)) selected.add(e.key);
                          } else {
                            selected.remove(e.key);
                          }
                        });
                      },
                      title: Text(e.value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Отмена'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() => _citizenship = selected.isEmpty ? ['RU'] : List<String>.from(selected));
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary100p,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Готово'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
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
                  Text(display, style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildContactProfileCardClear() {
    final isSelected = _contactProfileId == null;
    return InkWell(
      onTap: () => setState(() {
        _contactProfileId = null;
        _contactProfileIdCleared = true;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? AppColors.primary100p : const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Radio<int?>(
              value: null,
              groupValue: _contactProfileId,
              onChanged: (_) => setState(() {
                _contactProfileId = null;
                _contactProfileIdCleared = true;
              }),
            ),
            Expanded(
              child: Text('Не выбрано', style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactProfileCard(JobContactProfileEntity profile) {
    final name = profile.contactName;
    final phone = profile.contactPhone.isNotEmpty ? formatPhone(profile.contactPhone) : '';
    return InkWell(
      onTap: () => setState(() {
        _contactProfileId = profile.id;
        _contactProfileIdCleared = false;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _contactProfileId == profile.id ? AppColors.primary100p : const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Radio<int>(
              value: profile.id,
              groupValue: _contactProfileId,
              onChanged: (_) => setState(() {
                _contactProfileId = profile.id;
                _contactProfileIdCleared = false;
              }),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                  if (phone.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(phone, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                  ],
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

  void _openContactProfileSheet({JobContactProfileEntity? profile}) {
    final isEditing = profile != null;
    final nameController = TextEditingController(text: profile?.contactName ?? '');
    final phoneController = TextEditingController(text: phoneToMaskedInput(profile?.contactPhone));
    final phoneAltController = TextEditingController(text: phoneToMaskedInput(profile?.contactPhoneAlt));
    final telegramController = TextEditingController(text: profile?.contactTelegram ?? '');
    final whatsappController = TextEditingController(text: profile?.contactWhatsapp ?? '');
    final maxController = TextEditingController(text: profile?.contactMax ?? '');
    final emailController = TextEditingController(text: profile?.contactEmail ?? '');
    final formKey = GlobalKey<FormState>();
    showUniversalBottomSheet<void>(
      context: context,
      title: isEditing ? 'Редактировать контакты' : 'Контактные данные',
      useRootNavigator: false,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: nameController,
                labelText: 'ФИО *',
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите ФИО' : null,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: phoneController,
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
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите телефон' : null,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: phoneAltController,
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
              const SizedBox(height: 12),
              CustomTextField(controller: telegramController, labelText: 'Telegram'),
              const SizedBox(height: 12),
              CustomTextField(controller: whatsappController, labelText: 'WhatsApp'),
              const SizedBox(height: 12),
              CustomTextField(controller: maxController, labelText: 'MAX'),
              const SizedBox(height: 12),
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  final s = v?.trim() ?? '';
                  if (s.isEmpty) return null;
                  if (!RegExp(r'^[\w\-\.]+@[\w\-]+(\.[\w\-]+)+$').hasMatch(s)) return 'Введите корректный email';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена'))),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return;
                        final name = nameController.text.trim();
                        final phone = phoneFromMaskedInput(phoneController.text.trim());
                        final phoneAlt = phoneFromMaskedInput(phoneAltController.text.trim());
                        final telegram = telegramController.text.trim();
                        final whatsapp = whatsappController.text.trim();
                        final max = maxController.text.trim();
                        final email = emailController.text.trim();
                        if (isEditing) {
                          final updated = await _contactProfilesCubit.updateProfile(
                            id: profile.id,
                            contactName: name,
                            contactPosition: '—',
                            contactPhone: phone,
                            contactPhoneAlt: phoneAlt.isNotEmpty ? phoneAlt : null,
                            contactTelegram: telegram.isNotEmpty ? telegram : null,
                            contactWhatsapp: whatsapp.isNotEmpty ? whatsapp : null,
                            contactMax: max.isNotEmpty ? max : null,
                            contactEmail: email.isNotEmpty ? email : null,
                          );
                          if (mounted && updated != null) {
                            setState(() {
                              _contactProfileId = updated.id;
                              _contactProfileIdCleared = false;
                            });
                            Navigator.of(context).pop();
                          }
                        } else {
                          final created = await _contactProfilesCubit.createProfile(
                            isPrivate: true,
                            contactName: name,
                            contactPosition: '—',
                            contactPhone: phone,
                            contactPhoneAlt: phoneAlt.isNotEmpty ? phoneAlt : null,
                            contactTelegram: telegram.isNotEmpty ? telegram : null,
                            contactWhatsapp: whatsapp.isNotEmpty ? whatsapp : null,
                            contactMax: max.isNotEmpty ? max : null,
                            contactEmail: email.isNotEmpty ? email : null,
                          );
                          if (mounted && created != null) {
                            setState(() {
                              _contactProfileId = created.id;
                              _contactProfileIdCleared = false;
                            });
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
                      child: Text(isEditing ? 'Сохранить' : 'Создать'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMultiSelectRow({
    required String label,
    required Set<String> values,
    required Map<String, String> allOptions,
    required ValueChanged<Set<String>> onChanged,
  }) {
    final display = values.isEmpty ? 'Не выбрано' : values.map((e) => allOptions[e] ?? e).join(', ');
    return InkWell(
      onTap: () {
        final selected = Set<String>.from(values);
        showUniversalBottomSheet<void>(
          context: context,
          title: label,
          useRootNavigator: false,
          child: StatefulBuilder(
            builder: (context, setStateModal) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...allOptions.entries.map(
                    (entry) => CheckboxListTile(
                      value: selected.contains(entry.key),
                      onChanged: (checked) {
                        setStateModal(() {
                          if (checked == true) {
                            selected.add(entry.key);
                          } else {
                            selected.remove(entry.key);
                          }
                        });
                      },
                      title: Text(entry.value),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.background,
                              foregroundColor: AppColors.textPrimary,
                            ),
                            child: const Text('Отмена'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              onChanged(selected);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary100p,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Готово'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.strokeForDarkArea),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(display, style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
