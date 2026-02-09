import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/my_vacancy_responses_bloc.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MyVacancyResponsesScreen extends StatelessWidget {
  const MyVacancyResponsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyVacancyResponsesBloc(repository: getIt<JobsRepository>())..add(const MyVacancyResponsesGet()),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Мои отклики', withBack: true),
        backgroundColor: AppColors.background,
        body: BlocBuilder<MyVacancyResponsesBloc, MyVacancyResponsesState>(
          builder: (context, state) {
            if (state is LoadingMyVacancyResponsesState) {
              return const Center(child: LoadingCustom());
            }
            if (state is ErrorMyVacancyResponsesState) {
              return Center(
                child: ErrorCustom(
                  textError: state.errorForUser,
                  repeat: () {
                    context.read<MyVacancyResponsesBloc>().add(const MyVacancyResponsesGet());
                  },
                ),
              );
            }
            if (state is SuccessMyVacancyResponsesState) {
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
                          const Icon(Icons.send_outlined, size: 48, color: Color(0xFF9CA5AF)),
                          const SizedBox(height: 12),
                          Text(
                            'У вас пока нет откликов',
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
                  context.read<MyVacancyResponsesBloc>().add(const MyVacancyResponsesRefresh());
                  await Future<void>.delayed(const Duration(milliseconds: 400));
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  itemCount: responses.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _MyResponseCard(response: responses[index]);
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

/// Строка с логотипом и названием компании или ФИО работодателя (физлица).
class _EmployerRow extends StatelessWidget {
  final JobVacancyResponseEntity response;

  const _EmployerRow({required this.response});

  String get _employerDisplayName {
    final isCompany = response.employerContactIsPrivate != true && response.employerCompanyName != null && response.employerCompanyName!.trim().isNotEmpty;
    if (isCompany) {
      return response.employerCompanyName!.trim();
    }
    final fio = '${response.employerFirstName ?? ''} ${response.employerLastName ?? ''}'.trim();
    return fio.isNotEmpty ? fio : 'Работодатель';
  }

  @override
  Widget build(BuildContext context) {
    final hasLogo = response.employerLogoUrl != null && response.employerLogoUrl!.trim().isNotEmpty;
    final name = _employerDisplayName;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: hasLogo
              ? SizedBox(
                  width: 60,
                  height: 60,
                  child: NetworkImageWidget(imageUrl: getImageUrl(response.employerLogoUrl!), fit: BoxFit.cover, width: 40, height: 40, errorWidget: _placeholderLogo(name)),
                )
              : _placeholderLogo(name),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            name,
            style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _placeholderLogo(String name) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: AppColors.primary100p.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      child: Text(name.isNotEmpty ? name[0].toUpperCase() : '?', style: AppStyles.bold16s.copyWith(color: AppColors.primary100p)),
    );
  }
}

class _MyResponseCard extends StatelessWidget {
  final JobVacancyResponseEntity response;

  const _MyResponseCard({required this.response});

  @override
  Widget build(BuildContext context) {
    final title = response.vacancyTitle?.trim().isNotEmpty == true ? response.vacancyTitle! : 'Вакансия';
    final createdAt = response.createdAt;
    final statusStyle = _statusStyle(response.status);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.router.push(JobVacancyDetailRoute(id: response.vacancyId)),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.strokeForDarkArea),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Чип статуса и кнопка удаления — самый верх справа
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 22, color: AppColors.textSecondary),
                      onPressed: () => _confirmDeleteResponse(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                      style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    ),
                    StatusChip(
                      text: _mapStatus(response.status),
                      backgroundColor: statusStyle.bg,
                      textColor: statusStyle.fg,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      borderRadius: 999,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Работодатель: компания или ФИО физлица + логотип
                _EmployerRow(response: response),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (createdAt != null) ...[const SizedBox(height: 4), Text('Отправлен ${formatDateToDisplay(createdAt)}', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary))],
                  ],
                ),
                if (response.employerComment != null && response.employerComment!.trim().isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary5p,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary100p.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.comment_outlined, size: 14, color: AppColors.primary100p),
                            const SizedBox(width: 4),
                            Text('Ответ работодателя', style: AppStyles.bold12s.copyWith(color: AppColors.primary100p)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(response.employerComment!, style: AppStyles.regular13s.copyWith(color: AppColors.textPrimary)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  ({Color bg, Color fg}) _statusStyle(String status) {
    switch (status) {
      case 'new':
        return (bg: const Color(0xFFE5F0FF), fg: AppColors.textPrimary);
      case 'in_progress':
        return (bg: const Color(0xFFFFF3E0), fg: const Color(0xFFE65100));
      case 'accepted':
        return (bg: const Color(0xFFE8F5E9), fg: const Color(0xFF2E7D32));
      case 'rejected':
        return (bg: const Color(0xFFFFEBEE), fg: const Color(0xFFC62828));
      default:
        return (bg: const Color(0xFFF5F5F5), fg: AppColors.textSecondary);
    }
  }

  String _mapStatus(String status) {
    switch (status) {
      case 'new':
        return 'Новый';
      case 'in_progress':
        return 'В работе';
      case 'rejected':
        return 'Отклонён';
      case 'accepted':
        return 'Принят';
      default:
        return status;
    }
  }

  Future<void> _confirmDeleteResponse(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить отклик?'),
        content: const Text('Отклик будет удалён. Это действие нельзя отменить.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Отмена')),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      context.read<MyVacancyResponsesBloc>().add(MyVacancyResponsesDelete(responseId: response.id));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Отклик удалён')));
      }
    }
  }
}
