import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_response_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateVacancyResponseScreen extends StatefulWidget {
  final int id;

  const CreateVacancyResponseScreen({super.key, @PathParam('id') required this.id});

  @override
  State<CreateVacancyResponseScreen> createState() => _CreateVacancyResponseScreenState();
}

class _CreateVacancyResponseScreenState extends State<CreateVacancyResponseScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _coverLetterController;
  int? _selectedResumeId;
  List<JobResumeEntity> _resumes = [];
  bool _isLoadingResumes = true;
  String? _loadError;

  late final JobVacancyResponseCreateBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = JobVacancyResponseCreateBloc(repository: getIt<JobsRepository>());
    _coverLetterController = TextEditingController();
    _loadResumes();
  }

  Future<void> _loadResumes() async {
    setState(() {
      _isLoadingResumes = true;
      _loadError = null;
    });

    final repo = getIt<JobsRepository>();
    final result = await repo.getResumes(limit: 50);

    result.fold(
      (failure) {
        setState(() {
          _loadError = failure.message ?? 'Не удалось загрузить резюме';
          _isLoadingResumes = false;
        });
      },
      (resumes) {
        setState(() {
          _resumes = resumes;
          if (_resumes.isNotEmpty) {
            _selectedResumeId = _resumes.first.id;
          }
          _isLoadingResumes = false;
        });
      },
    );
  }

  @override
  void dispose() {
    _coverLetterController.dispose();
    _bloc.close();
    super.dispose();
  }

  void _submit() {
    if (_selectedResumeId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Выберите резюме для отклика'), backgroundColor: Colors.red));
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    _bloc.add(
      JobVacancyResponseCreateEvent.create(
        vacancyId: widget.id,
        resumeId: _selectedResumeId!,
        coverLetter: _coverLetterController.text.trim().isNotEmpty ? _coverLetterController.text.trim() : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<JobVacancyResponseCreateBloc, JobVacancyResponseCreateState>(
        listener: (context, state) {
          state.maybeWhen(
            created: (response) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Отклик отправлен'), backgroundColor: Colors.green));
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
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Отклик на вакансию', withBack: true),
          backgroundColor: AppColors.background,
          body: BlocBuilder<JobVacancyResponseCreateBloc, JobVacancyResponseCreateState>(
            builder: (context, state) {
              final isSubmitting = state.maybeWhen(creating: () => true, orElse: () => false);

              if (_isLoadingResumes) {
                return const Center(child: LoadingCustom());
              }

              if (_loadError != null) {
                return Center(
                  child: ErrorCustom(textError: _loadError!, repeat: _loadResumes),
                );
              }

              if (_resumes.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('У вас пока нет резюме', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 8),
                      Text(
                        'Создайте резюме во вкладке "Резюме", чтобы откликаться на вакансии.',
                        style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                );
              }

              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Выберите резюме', style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<int>(
                            value: _selectedResumeId,
                            decoration: const InputDecoration(
                              labelText: 'Резюме',
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            ),
                            items: _resumes
                                .map((r) => DropdownMenuItem<int>(value: r.id, child: Text(r.title)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedResumeId = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Сопроводительное письмо (необязательно)',
                            style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: _coverLetterController,
                            labelText: 'Напишите, почему вы подходите для этой вакансии',
                            maxLines: 6,
                          ),
                          const SizedBox(height: 24),
                          CustomButton(
                            title: 'Отправить отклик',
                            textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                            borderColor: AppColors.primary100p,
                            backgroundColor: AppColors.primary100p,
                            onPressed: isSubmitting ? null : _submit,
                            disabled: isSubmitting,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  if (isSubmitting)
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
}
