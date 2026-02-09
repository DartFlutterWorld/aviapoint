import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/employer_vacancy_responses_bloc.dart';
import 'package:aviapoint/work/presentation/widgets/vacancy_response_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EmployerVacancyResponsesScreen extends StatelessWidget {
  const EmployerVacancyResponsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmployerVacancyResponsesBloc(repository: getIt<JobsRepository>())
        ..add(const EmployerVacancyResponsesGet()),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Отклики по моим вакансиям', withBack: true),
        backgroundColor: AppColors.background,
        body: BlocBuilder<EmployerVacancyResponsesBloc, EmployerVacancyResponsesState>(
          builder: (context, state) {
            if (state is LoadingEmployerVacancyResponsesState) {
              return const Center(child: LoadingCustom());
            }
            if (state is ErrorEmployerVacancyResponsesState) {
              return Center(
                child: ErrorCustom(
                  textError: state.errorForUser,
                  repeat: () {
                    context.read<EmployerVacancyResponsesBloc>().add(const EmployerVacancyResponsesGet());
                  },
                ),
              );
            }
            if (state is SuccessEmployerVacancyResponsesState) {
              final responses = state.responses;
              if (responses.isEmpty) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.strokeForDarkArea),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.mail_outline, size: 48, color: Color(0xFF9CA5AF)),
                          const SizedBox(height: 12),
                          Text(
                            'Пока нет откликов по вашим вакансиям',
                            style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<EmployerVacancyResponsesBloc>().add(const EmployerVacancyResponsesRefresh());
                  await Future<void>.delayed(const Duration(milliseconds: 400));
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  itemCount: responses.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final response = responses[index];
                    return VacancyResponseCard(
                      vacancyId: response.vacancyId,
                      response: response,
                      vacancyTitle: response.vacancyTitle,
                      onUpdateStatus: (vid, rid, status, comment) {
                        context.read<EmployerVacancyResponsesBloc>().add(
                              EmployerVacancyResponsesUpdateStatus(
                                vacancyId: vid,
                                responseId: rid,
                                status: status,
                                employerComment: comment,
                              ),
                            );
                      },
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
