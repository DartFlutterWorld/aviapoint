import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_vacancies_bloc.dart';
import 'package:aviapoint/work/presentation/widgets/job_vacancy_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _handleCreateVacancyTap(BuildContext context, {VoidCallback? onReturn}) async {
  final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
  if (!isAuthenticated) {
    await showLogin(
      context,
      callback: () {
        if (context.mounted) {
          context.router
              .push(
                BaseRoute(
                  children: [
                    WorkNavigationRoute(children: [const CreateJobVacancyRoute()]),
                  ],
                ),
              )
              .then((_) {
                if (context.mounted) onReturn?.call();
              });
        }
      },
    );
    return;
  }
  await context.router.push(
    BaseRoute(
      children: [
        WorkNavigationRoute(children: [const CreateJobVacancyRoute()]),
      ],
    ),
  );
  if (context.mounted) onReturn?.call();
}

class MyVacanciesWidget extends StatelessWidget {
  final int userId;

  const MyVacanciesWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = JobsVacanciesBloc(repository: getIt<JobsRepository>());
        bloc.add(JobsVacanciesEvent.get(employerId: userId, includeInactive: true));
        return bloc;
      },
      child: BlocListener<JobsVacanciesRefreshCubit, int>(
        bloc: getIt<JobsVacanciesRefreshCubit>(),
        listener: (context, state) {
          _refreshVacancies(context, userId);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Мои вакансии', style: AppStyles.bold20s.copyWith(color: const Color(0xFF374151))),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => context.router.push(
                        BaseRoute(
                          children: [
                            WorkNavigationRoute(children: [const EmployerVacancyResponsesRoute()]),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.mail_outline, size: 18, color: AppColors.primary100p),
                          const SizedBox(width: 4),
                          Text('Отклики', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => _handleCreateVacancyTap(context, onReturn: () => context.read<JobsVacanciesBloc>().add(JobsVacanciesEvent.refresh(employerId: userId, includeInactive: true))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.add, size: 18, color: AppColors.primary100p),
                          const SizedBox(width: 4),
                          Text('Создать', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            BlocBuilder<JobsVacanciesBloc, JobsVacanciesState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const Center(
                    child: Padding(padding: EdgeInsets.all(20), child: LoadingCustom()),
                  ),
                  loadingMore: (vacancies) => _buildList(context, vacancies, isLoading: true),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(errorForUser, style: AppStyles.regular14s.copyWith(color: const Color(0xFFEF4444))),
                    ),
                  ),
                  success: (vacancies, hasMore) => _buildList(context, vacancies, isLoading: false),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<JobVacancyEntity> vacancies, {required bool isLoading}) {
    if (vacancies.isEmpty && !isLoading) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Center(
          child: Column(
            children: [
              const Icon(Icons.work_outline, size: 48, color: Color(0xFF9CA5AF)),
              const SizedBox(height: 12),
              Text('У вас пока нет вакансий', style: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF))),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _handleCreateVacancyTap(context, onReturn: () => context.read<JobsVacanciesBloc>().add(JobsVacanciesEvent.refresh(employerId: userId, includeInactive: true))),
                child: Text('Создать вакансию', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
              ),
            ],
          ),
        ),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.90;
    const maxCardWidth = 480.0;
    final clampedWidth = math.min(cardWidth, maxCardWidth);

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: vacancies.length,
        itemBuilder: (context, index) {
          final vacancy = vacancies[index];
          return Container(
            width: clampedWidth,
            margin: const EdgeInsets.only(right: 12),
            child: JobVacancyCard(
              vacancy: vacancy,
              showPublicationStatus: true,
              onTap: () => context.router.push(
                BaseRoute(
                  children: [
                    WorkNavigationRoute(children: [JobVacancyDetailRoute(id: vacancy.id)]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _refreshVacancies(BuildContext context, int userId) {
  if (!context.mounted) return;
  context.read<JobsVacanciesBloc>().add(JobsVacanciesEvent.refresh(employerId: userId, includeInactive: true));
}
