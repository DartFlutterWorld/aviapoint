import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:mask/mask/mask.dart';
import 'package:aviapoint/work/domain/entities/job_contact_profile_entity.dart';
import 'package:aviapoint/work/presentation/bloc/contact_profiles_cubit.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/job_resume_edit_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateJobResumeScreen extends StatefulWidget {
  const CreateJobResumeScreen({super.key});

  @override
  State<CreateJobResumeScreen> createState() => _CreateJobResumeScreenState();
}

class _CreateJobResumeScreenState extends State<CreateJobResumeScreen> {
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
  List<String> _citizenship = ['RU'];
  bool _workPermit = true;
  XFile? _pickedPhoto;
  List<XFile> _additionalPhotos = [];
  bool _isUploadingPhoto = false;
  String? _selectedAddress;
  final List<_PendingExperience> _pendingExperiences = [];
  final List<_PendingEducation> _pendingEducations = [];

  final Set<String> _employmentTypes = {};
  final Set<String> _schedules = {};
  bool _isVisibleForEmployers = true;

  late final JobResumeEditBloc _bloc;
  late final ContactProfilesCubit _contactProfilesCubit;

  @override
  void initState() {
    super.initState();
    _bloc = JobResumeEditBloc(repository: getIt<JobsRepository>());
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
    _bloc.close();
    _contactProfilesCubit.close();
    super.dispose();
  }

  void _selectDefaultContactProfile(List<JobContactProfileEntity> profiles) {
    if (_contactProfileId != null || profiles.isEmpty) return;
    final sorted = List<JobContactProfileEntity>.from(profiles);
    sorted.sort((a, b) {
      final aDate = DateTime.tryParse(a.createdAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bDate = DateTime.tryParse(b.createdAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });
    setState(() => _contactProfileId = sorted.first.id);
  }

  /// Выбор прикреплённых файлов: изображения, PDF, Word, Excel.
  Future<List<XFile>> _pickResumeAdditionalFiles() async {
    const typeGroup = XTypeGroup(
      label: 'Изображения, PDF, Word, Excel',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'pdf', 'doc', 'docx', 'xls', 'xlsx'],
      uniformTypeIdentifiers: [
        'public.jpeg', 'public.png', 'public.gif', 'public.webp', 'public.image', 'com.adobe.pdf',
        'com.microsoft.word.doc', 'org.openxmlformats.wordprocessingml.document',
        'com.microsoft.excel.xls', 'org.openxmlformats.spreadsheetml.sheet',
      ],
    );
    final files = await openFiles(acceptedTypeGroups: const [typeGroup]);
    return files;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_contactProfileId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите контактный профиль для работодателей'), backgroundColor: Colors.red));
      return;
    }

    final desiredSalary = _salaryController.text.trim().isNotEmpty ? int.parse(_salaryController.text.trim()) : null;
    final flightHoursTotal = _flightHoursTotalController.text.trim().isNotEmpty ? int.parse(_flightHoursTotalController.text.trim()) : null;
    final flightHoursPic = _flightHoursPicController.text.trim().isNotEmpty ? int.parse(_flightHoursPicController.text.trim()) : null;
    final addressValue = (_selectedAddress ?? _addressController.text.trim()).trim();
    final dateOfBirthValue = _dateOfBirthController.text.trim();
    final dateOfBirth = dateOfBirthValue.isEmpty ? null : dateOfBirthValue;

    _bloc.add(
      JobResumeEditEvent.create(
        title: _titleController.text.trim(),
        about: _aboutController.text.trim().isNotEmpty ? _aboutController.text.trim() : null,
        desiredSalary: desiredSalary,
        currency: _currency,
        employmentTypes: _employmentTypes.isNotEmpty ? _employmentTypes.join(',') : null,
        schedules: _schedules.isNotEmpty ? _schedules.join(',') : null,
        readyToRelocate: _readyToRelocate,
        readyForBusinessTrips: _readyForBusinessTrips,
        address: addressValue.isNotEmpty ? addressValue : null,
        dateOfBirth: dateOfBirth,
        citizenship: _citizenship.isEmpty ? null : _citizenship,
        workPermit: _workPermit,
        contactProfileId: _contactProfileId,
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
        BlocProvider<JobResumeEditBloc>.value(value: _bloc),
        BlocProvider<ContactProfilesCubit>.value(value: _contactProfilesCubit),
      ],
      child: BlocListener<JobResumeEditBloc, JobResumeEditState>(
        listener: (context, state) {
          state.maybeWhen(
            created: (resume) async {
              if (mounted) setState(() => _isUploadingPhoto = true);
              final repo = getIt<JobsRepository>();
              if (_pickedPhoto != null) {
                final result = await repo.uploadResumePhoto(resume.id, _pickedPhoto!);
                if (!mounted) return;
                result.fold(
                  (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(f.responseMessage ?? f.message ?? 'Фото не загружено'),
                    backgroundColor: Colors.orange,
                  )),
                  (_) {},
                );
              }
              if (_additionalPhotos.isNotEmpty && mounted) {
                final result = await repo.uploadResumeAdditionalPhotos(resume.id, _additionalPhotos);
                if (!mounted) return;
                result.fold(
                  (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(f.responseMessage ?? f.message ?? 'Доп. фото не загружены'),
                    backgroundColor: Colors.orange,
                  )),
                  (_) {},
                );
              }
              for (final exp in _pendingExperiences) {
                if (!mounted) return;
                await repo.createResumeExperience(
                  resumeId: resume.id,
                  companyName: exp.companyName,
                  startDate: exp.startDate,
                  endDate: exp.endDate,
                  isCurrent: exp.isCurrent,
                  responsibilitiesAndAchievements: exp.responsibilitiesAndAchievements,
                );
              }
              for (final edu in _pendingEducations) {
                if (!mounted) return;
                await repo.createResumeEducation(
                  resumeId: resume.id,
                  institution: edu.institution,
                  speciality: edu.speciality,
                  yearStart: edu.yearStart,
                  yearEnd: edu.yearEnd,
                  isCurrent: edu.isCurrent,
                );
              }
              if (!mounted) return;
              setState(() => _isUploadingPhoto = false);
              getIt<JobsResumesRefreshCubit>().notify();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Резюме создано'), backgroundColor: Colors.green));
              context.router.replace(JobResumeDetailRoute(id: resume.id));
            },
            error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Создать резюме', withBack: true),
          backgroundColor: AppColors.background,
          body: BlocBuilder<JobResumeEditBloc, JobResumeEditState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(creating: () => true, orElse: () => false) || _isUploadingPhoto;

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
                                    _dateOfBirthController.text = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildCitizenshipSelector(),
                          const SizedBox(height: 16),
                          SwitchListTile(value: _workPermit, onChanged: (value) => setState(() => _workPermit = value), title: const Text('Разрешение на работу в РФ')),
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
                                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(textError: errorForUser, repeat: _contactProfilesCubit.fetch),
                                success: (profiles) {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    _selectDefaultContactProfile(profiles);
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
                          const SizedBox(height: 16),
                          _buildCreatePhotoPicker(),
                          const SizedBox(height: 16),
                          _buildExperiencesSection(),
                          const SizedBox(height: 16),
                          _buildEducationsSection(),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(controller: _flightHoursTotalController, labelText: 'Налёт всего (часы)', keyboardType: TextInputType.number),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: CustomTextField(controller: _flightHoursPicController, labelText: 'Налёт PIC (часы)', keyboardType: TextInputType.number),
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
                            allOptions: const {'full_time': 'Полная занятость', 'part_time': 'Частичная занятость', 'project': 'Проектная работа', 'internship': 'Стажировка'},
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
                            allOptions: const {'office': 'Офис', 'remote': 'Удалённо', 'hybrid': 'Гибрид', 'shift': 'Сменный график', 'fly_in_fly_out': 'Вахта'},
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
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2))],
                            ),
                            child: SwitchListTile(
                              title: Text('Опубликовать резюме', style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary)),
                              subtitle: Text('Если выключено, резюме не будет видно работодателям', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
                              value: _isVisibleForEmployers,
                              onChanged: (v) => setState(() => _isVisibleForEmployers = v),
                              activeColor: AppColors.primary100p,
                            ),
                          ),
                          const SizedBox(height: 24),
                          CustomButton(
                            title: 'Сохранить резюме',
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

  Future<void> _pickResumePhoto() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85, maxWidth: 1920, maxHeight: 1920);
    if (image != null && mounted) setState(() => _pickedPhoto = image);
  }

  Widget _buildCreatePhotoPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ваше фото *', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          width: double.infinity,
          child: InkWell(
            onTap: _pickResumePhoto,
            borderRadius: BorderRadius.circular(12),
            child: _pickedPhoto != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        FutureBuilder<Uint8List>(
                          future: _pickedPhoto!.readAsBytes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return Image.memory(snapshot.data!, fit: BoxFit.cover);
                            }
                            return Container(
                              color: AppColors.strokeForDarkArea,
                              child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            );
                          },
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () => setState(() => _pickedPhoto = null),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                              child: const Icon(Icons.close, size: 16, color: Colors.white),
                            ),
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
                    child: Column(
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
        if (_pickedPhoto != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('Фото будет загружено после сохранения резюме', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
          ),
        if (_additionalPhotos.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text('Прикреплённые файлы', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _additionalPhotos.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final file = _additionalPhotos[index];
                final name = file.name.toLowerCase();
                final isPdf = name.endsWith('.pdf');
                final isWord = name.endsWith('.doc') || name.endsWith('.docx');
                final isExcel = name.endsWith('.xls') || name.endsWith('.xlsx');
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 72,
                        height: 72,
                        color: AppColors.strokeForDarkArea,
                        child: isPdf
                            ? const Center(child: Icon(Icons.picture_as_pdf, size: 36, color: Colors.red))
                            : isWord
                                ? const Center(child: Icon(Icons.description, size: 36, color: Colors.blue))
                                : isExcel
                                    ? const Center(child: Icon(Icons.table_chart, size: 36, color: Colors.green))
                                    : FutureBuilder<Uint8List>(
                                future: file.readAsBytes(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData && snapshot.data != null) {
                                    return Image.memory(snapshot.data!, fit: BoxFit.cover);
                                  }
                                  return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                                },
                              ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.white),
                      style: IconButton.styleFrom(backgroundColor: Colors.black54, padding: const EdgeInsets.all(4), minimumSize: const Size(24, 24)),
                      onPressed: () => setState(() => _additionalPhotos.removeAt(index)),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          OutlinedButton.icon(
            icon: const Icon(Icons.attach_file, size: 18),
            label: const Text('Добавить ещё файлы'),
            onPressed: () async {
              final xFiles = await _pickResumeAdditionalFiles();
              if (xFiles.isNotEmpty && mounted) setState(() => _additionalPhotos.addAll(xFiles));
            },
          ),
        ] else
          OutlinedButton.icon(
            icon: const Icon(Icons.attach_file, size: 18),
            label: const Text('Прикрепить файлы (грамоты, сертификаты, дипломы, лицензии)'),
            onPressed: () async {
              final xFiles = await _pickResumeAdditionalFiles();
              if (xFiles.isNotEmpty && mounted) setState(() => _additionalPhotos.addAll(xFiles));
            },
          ),
      ],
    );
  }

  Widget _buildExperiencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Опыт работы', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        ..._pendingExperiences.asMap().entries.map((e) {
          final i = e.key;
          final exp = e.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(exp.companyName, style: AppStyles.bold14s),
              subtitle: Text(() {
                    final start = formatDateToDisplay(exp.startDate);
                    final end = exp.isCurrent ? 'по н.в.' : formatDateToDisplay(exp.endDate);
                    return [start, end].where((s) => s.isNotEmpty).join(' — ');
                  }(), style: AppStyles.regular12s),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, size: 22, color: AppColors.primary100p),
                    onPressed: () => _showCreateExperienceSheet(editIndex: i),
                    tooltip: 'Редактировать',
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => setState(() => _pendingExperiences.removeAt(i)),
                    tooltip: 'Удалить',
                  ),
                ],
              ),
              onTap: () => _showCreateExperienceSheet(editIndex: i),
            ),
          );
        }),
        OutlinedButton.icon(icon: const Icon(Icons.add), label: const Text('Добавить место работы'), onPressed: () => _showCreateExperienceSheet()),
      ],
    );
  }

  Widget _buildEducationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Образование', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        ..._pendingEducations.asMap().entries.map((e) {
          final i = e.key;
          final edu = e.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(edu.institution, style: AppStyles.bold14s),
              subtitle: Text(
                '${edu.speciality ?? ''} ${edu.yearStart != null || edu.yearEnd != null ? '${formatYearToDisplay(edu.yearStart)} — ${edu.isCurrent ? 'по н.в.' : formatYearToDisplay(edu.yearEnd)}' : ''}'.trim(),
                style: AppStyles.regular12s,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => setState(() => _pendingEducations.removeAt(i)),
              ),
              onTap: () => _showCreateEducationSheet(editIndex: i),
            ),
          );
        }),
        OutlinedButton.icon(icon: const Icon(Icons.add), label: const Text('Добавить образование'), onPressed: () => _showCreateEducationSheet()),
      ],
    );
  }

  void _showCreateExperienceSheet({int? editIndex}) {
    _PendingExperience? existing = editIndex != null && editIndex < _pendingExperiences.length ? _pendingExperiences[editIndex] : null;
    final companyController = TextEditingController(text: existing?.companyName ?? '');
    final responsibilitiesController = TextEditingController(text: existing?.responsibilitiesAndAchievements ?? '');
    final startDateController = TextEditingController(text: existing?.startDate ?? '');
    final endDateController = TextEditingController(text: existing?.endDate ?? '');
    bool isCurrent = existing?.isCurrent ?? false;
    showUniversalBottomSheet<void>(
      context: context,
      title: existing == null ? 'Добавить опыт' : 'Редактировать опыт',
      useRootNavigator: false,
      child: StatefulBuilder(
        builder: (ctx, setModalState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(controller: companyController, labelText: 'Компания *', validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите название компании' : null),
              const SizedBox(height: 12),
              CustomTextField(
                controller: startDateController,
                labelText: 'Дата начала',
                hintText: 'ГГГГ-ММ-ДД',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today, color: AppColors.textSecondary),
                  onPressed: () async {
                    final d = await showDatePicker(context: ctx, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
                    if (d != null) {
                      startDateController.text = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
                      setModalState(() {});
                    }
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
                    if (d != null) {
                      endDateController.text = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
                      setModalState(() {});
                    }
                  },
                ),
              ),
              CheckboxListTile(
                value: isCurrent,
                onChanged: (v) {
                  setModalState(() {
                    isCurrent = v ?? false;
                    if (isCurrent) endDateController.clear();
                  });
                },
                title: const Text('По настоящее время'),
              ),
              const SizedBox(height: 12),
              CustomTextField(controller: responsibilitiesController, labelText: 'Обязанности и достижения', maxLines: 4),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (companyController.text.trim().isEmpty) return;
                        final entry = _PendingExperience(
                          companyName: companyController.text.trim(),
                          startDate: startDateController.text.trim().isNotEmpty ? startDateController.text.trim() : null,
                          endDate: endDateController.text.trim().isNotEmpty ? endDateController.text.trim() : null,
                          isCurrent: isCurrent,
                          responsibilitiesAndAchievements: responsibilitiesController.text.trim().isNotEmpty ? responsibilitiesController.text.trim() : null,
                        );
                        if (editIndex != null && editIndex < _pendingExperiences.length) {
                          setState(() => _pendingExperiences[editIndex] = entry);
                        } else {
                          setState(() => _pendingExperiences.add(entry));
                        }
                        if (mounted) Navigator.of(context).pop();
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

  void _showCreateEducationSheet({int? editIndex}) {
    _PendingEducation? existing = editIndex != null && editIndex < _pendingEducations.length ? _pendingEducations[editIndex] : null;
    final institutionController = TextEditingController(text: existing?.institution ?? '');
    final specialityController = TextEditingController(text: existing?.speciality ?? '');
    final yearStartController = TextEditingController(text: existing?.yearStart?.toString() ?? '');
    final yearEndController = TextEditingController(text: existing?.yearEnd?.toString() ?? '');
    bool isCurrent = existing?.isCurrent ?? false;
    showUniversalBottomSheet<void>(
      context: context,
      title: existing == null ? 'Добавить образование' : 'Редактировать образование',
      useRootNavigator: false,
      child: StatefulBuilder(
        builder: (ctx, setModalState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(controller: institutionController, labelText: 'Учебное заведение *', validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите название' : null),
              const SizedBox(height: 12),
              CustomTextField(controller: specialityController, labelText: 'Специализация'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(controller: yearStartController, labelText: 'Год начала', keyboardType: TextInputType.number),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(controller: yearEndController, labelText: 'Год окончания', keyboardType: TextInputType.number),
                  ),
                ],
              ),
              CheckboxListTile(
                value: isCurrent,
                onChanged: (v) {
                  setModalState(() {
                    isCurrent = v ?? false;
                    if (isCurrent) yearEndController.clear();
                  });
                },
                title: const Text('По настоящее время'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (institutionController.text.trim().isEmpty) return;
                        final yStart = int.tryParse(yearStartController.text.trim());
                        final yEnd = int.tryParse(yearEndController.text.trim());
                        final entry = _PendingEducation(
                          institution: institutionController.text.trim(),
                          speciality: specialityController.text.trim().isNotEmpty ? specialityController.text.trim() : null,
                          yearStart: yStart,
                          yearEnd: yEnd,
                          isCurrent: isCurrent,
                        );
                        if (editIndex != null && editIndex < _pendingEducations.length) {
                          setState(() => _pendingEducations[editIndex] = entry);
                        } else {
                          setState(() => _pendingEducations.add(entry));
                        }
                        if (mounted) Navigator.of(context).pop();
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

  static const Map<String, String> _countryNames = {'RU': 'Россия', 'BY': 'Беларусь', 'KZ': 'Казахстан', 'UA': 'Украина', 'UZ': 'Узбекистан', 'OTHER': 'Другое'};

  Widget _buildCitizenshipSelector() {
    const label = 'Гражданство';
    final display = _citizenship.isEmpty ? 'Не выбрано' : _citizenship.map((c) => _countryNames[c] ?? c).join(', ');
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
                          child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() => _citizenship = selected.isEmpty ? ['RU'] : List<String>.from(selected));
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
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

  Widget _buildContactProfileCard(JobContactProfileEntity profile) {
    final name = profile.contactName;
    final phone = profile.contactPhone.isNotEmpty ? formatPhone(profile.contactPhone) : '';
    return InkWell(
      onTap: () => setState(() => _contactProfileId = profile.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _contactProfileId == profile.id ? AppColors.primary100p : const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Radio<int>(value: profile.id, groupValue: _contactProfileId, onChanged: (_) => setState(() => _contactProfileId = profile.id)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
                  if (phone.isNotEmpty) ...[const SizedBox(height: 4), Text(phone, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary))],
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
              CustomTextField(controller: nameController, labelText: 'ФИО *', validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите ФИО' : null),
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
                inputFormatters: [
                  Mask.generic(masks: ['(###) ###-##-##']),
                ],
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
                inputFormatters: [
                  Mask.generic(masks: ['(###) ###-##-##']),
                ],
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
                  Expanded(
                    child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
                  ),
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
                            setState(() => _contactProfileId = updated.id);
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
                            setState(() => _contactProfileId = created.id);
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

  Widget _buildMultiSelectRow({required String label, required Set<String> values, required Map<String, String> allOptions, required ValueChanged<Set<String>> onChanged}) {
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
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.background, foregroundColor: AppColors.textPrimary),
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
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
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
}

class _PendingExperience {
  final String companyName;
  final String? startDate;
  final String? endDate;
  final bool isCurrent;
  final String? responsibilitiesAndAchievements;
  _PendingExperience({required this.companyName, this.startDate, this.endDate, this.isCurrent = false, this.responsibilitiesAndAchievements});
}

class _PendingEducation {
  final String institution;
  final String? speciality;
  final int? yearStart;
  final int? yearEnd;
  final bool isCurrent;
  _PendingEducation({required this.institution, this.speciality, this.yearStart, this.yearEnd, this.isCurrent = false});
}
