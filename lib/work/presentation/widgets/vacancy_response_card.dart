import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Карточка отклика на вакансию. Используется в деталке вакансии и в списке «Отклики по моим вакансиям».
/// [vacancyTitle] — если задано, показывается над блоком кандидата (для списка по всем вакансиям).
void showChangeStatusBottomSheet(
  BuildContext context, {
  required int vacancyId,
  required JobVacancyResponseEntity response,
  required void Function(String status, String? employerComment) onSave,
}) {
  showMaterialModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) => _ChangeStatusSheet(
      vacancyId: vacancyId,
      response: response,
      onSave: (status, comment) {
        onSave(status, comment);
        if (sheetContext.mounted) {
          ScaffoldMessenger.of(sheetContext).showSnackBar(
            const SnackBar(content: Text('Статус обновлён'), backgroundColor: Colors.green),
          );
          Navigator.pop(sheetContext);
        }
      },
    ),
  );
}

class VacancyResponseCard extends StatelessWidget {
  final int vacancyId;
  final JobVacancyResponseEntity response;
  final String? vacancyTitle;
  final void Function(int vacancyId, int responseId, String status, String? employerComment) onUpdateStatus;

  const VacancyResponseCard({
    super.key,
    required this.vacancyId,
    required this.response,
    this.vacancyTitle,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    final name = '${response.candidateFirstName ?? ''} ${response.candidateLastName ?? ''}'.trim();
    final createdAt = response.createdAt;
    final statusStyle = _statusStyle(response.status);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.router.push(JobResumeDetailRoute(id: response.resumeId)),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.strokeForDarkArea),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (vacancyTitle != null && vacancyTitle!.trim().isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary100p.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      vacancyTitle!,
                      style: AppStyles.regular13s.copyWith(color: AppColors.primary100p),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primary100p.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                        style: AppStyles.bold18s.copyWith(color: AppColors.primary100p),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.isEmpty ? 'Кандидат' : name,
                            style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary),
                          ),
                          if (createdAt != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              'Отправлен ${formatDateToDisplay(createdAt)}',
                              style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textSecondary),
                  ],
                ),
                if (_hasAnyContact(response)) ...[
                  const SizedBox(height: 12),
                  Text(
                    'Контакты',
                    style: AppStyles.bold12s.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      if (response.candidatePhone != null && response.candidatePhone!.isNotEmpty)
                        _contactChip(Icons.phone, formatPhone(response.candidatePhone!)),
                      if (response.candidatePhoneAlt != null && response.candidatePhoneAlt!.isNotEmpty)
                        _contactChip(Icons.phone, formatPhone(response.candidatePhoneAlt!)),
                      if (response.candidateTelegram != null && response.candidateTelegram!.isNotEmpty)
                        _contactChip(Icons.send, response.candidateTelegram!),
                      if (response.candidateWhatsapp != null && response.candidateWhatsapp!.isNotEmpty)
                        _contactChip(Icons.chat, response.candidateWhatsapp!),
                      if (response.candidateMax != null && response.candidateMax!.isNotEmpty)
                        _contactChip(Icons.message, response.candidateMax!),
                      if (response.candidateEmail != null && response.candidateEmail!.isNotEmpty)
                        _contactChip(Icons.email, response.candidateEmail!),
                    ],
                  ),
                ],
                if (response.coverLetter != null && response.coverLetter!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.strokeForDarkArea.withOpacity(0.5)),
                    ),
                    child: Text(
                      response.coverLetter!,
                      style: AppStyles.regular14s.copyWith(color: AppColors.textPrimary, height: 1.4),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    StatusChip(
                      text: _mapStatus(response.status),
                      backgroundColor: statusStyle.bg,
                      textColor: statusStyle.fg,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      borderRadius: 999,
                    ),
                    TextButton.icon(
                      onPressed: () => _openChangeStatusSheet(context),
                      icon: const Icon(Icons.reply_outlined, size: 16, color: AppColors.primary100p),
                      label: Text(
                        'Ответить кандидату',
                        style: AppStyles.regular12s.copyWith(color: AppColors.primary100p),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
                if (response.employerComment != null && response.employerComment!.isNotEmpty) ...[
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
                            Text(
                              'Ваш комментарий',
                              style: AppStyles.bold12s.copyWith(color: AppColors.primary100p),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          response.employerComment!,
                          style: AppStyles.regular13s.copyWith(color: AppColors.textPrimary),
                        ),
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

  void _openChangeStatusSheet(BuildContext context) {
    showChangeStatusBottomSheet(
      context,
      vacancyId: vacancyId,
      response: response,
      onSave: (status, comment) {
        onUpdateStatus(vacancyId, response.id, status, comment);
      },
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

  Widget _contactChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.strokeForDarkArea),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.primary100p),
          const SizedBox(width: 6),
          Text(text, style: AppStyles.regular12s.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  static bool _hasAnyContact(JobVacancyResponseEntity r) {
    return (r.candidatePhone != null && r.candidatePhone!.isNotEmpty) ||
        (r.candidatePhoneAlt != null && r.candidatePhoneAlt!.isNotEmpty) ||
        (r.candidateTelegram != null && r.candidateTelegram!.isNotEmpty) ||
        (r.candidateWhatsapp != null && r.candidateWhatsapp!.isNotEmpty) ||
        (r.candidateMax != null && r.candidateMax!.isNotEmpty) ||
        (r.candidateEmail != null && r.candidateEmail!.isNotEmpty);
  }

  static String _mapStatus(String status) {
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
}

class _ChangeStatusSheet extends StatefulWidget {
  final int vacancyId;
  final JobVacancyResponseEntity response;
  final void Function(String status, String? employerComment) onSave;

  const _ChangeStatusSheet({
    required this.vacancyId,
    required this.response,
    required this.onSave,
  });

  @override
  State<_ChangeStatusSheet> createState() => _ChangeStatusSheetState();
}

class _ChangeStatusSheetState extends State<_ChangeStatusSheet> {
  late String _status;
  final TextEditingController _commentController = TextEditingController();
  bool _isSaving = false;

  static const List<MapEntry<String, String>> _statusOptions = [
    MapEntry('new', 'Новый'),
    MapEntry('in_progress', 'В работе'),
    MapEntry('accepted', 'Принят'),
    MapEntry('rejected', 'Отклонён'),
  ];

  @override
  void initState() {
    super.initState();
    _status = widget.response.status;
    _commentController.text = widget.response.employerComment ?? '';
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_isSaving) return;
    setState(() => _isSaving = true);
    final comment = _commentController.text.trim();
    widget.onSave(_status, comment.isEmpty ? null : comment);
    setState(() => _isSaving = false);
  }

  @override
  Widget build(BuildContext context) {
    final name =
        '${widget.response.candidateFirstName ?? ''} ${widget.response.candidateLastName ?? ''}'.trim();
    return UniversalBottomSheet(
      title: 'Статус отклика',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (name.isNotEmpty) ...[
              Text(
                name,
                style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 4),
            ],
            Text(
              'Выберите новый статус для отклика',
              style: AppStyles.regular13s.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _statusOptions.map((e) {
                final selected = _status == e.key;
                return GestureDetector(
                  onTap: () => setState(() => _status = e.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: selected ? _chipBg(e.key) : _chipBg(e.key).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: selected ? _chipFg(e.key) : AppColors.strokeForDarkArea,
                        width: selected ? 2 : 1,
                      ),
                    ),
                    child: Text(
                      e.value,
                      style: AppStyles.regular14s.copyWith(
                        fontWeight: FontWeight.w500,
                        color: selected ? _chipFg(e.key) : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Комментарий для кандидата',
              style: AppStyles.bold12s.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 6),
            CustomTextField(
              controller: _commentController,
              hintText: 'Необязательно. Например: приглашаем на собеседование',
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: _isSaving ? 'Сохранение...' : 'Сохранить статус',
              textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
              borderColor: AppColors.primary100p,
              backgroundColor: AppColors.primary100p,
              onPressed: _isSaving ? null : _save,
              disabled: _isSaving,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Color _chipBg(String status) {
    switch (status) {
      case 'new':
        return const Color(0xFFE5F0FF);
      case 'in_progress':
        return const Color(0xFFFFF3E0);
      case 'accepted':
        return const Color(0xFFE8F5E9);
      case 'rejected':
        return const Color(0xFFFFEBEE);
      default:
        return const Color(0xFFF5F5F5);
    }
  }

  Color _chipFg(String status) {
    switch (status) {
      case 'new':
        return AppColors.textPrimary;
      case 'in_progress':
        return const Color(0xFFE65100);
      case 'accepted':
        return const Color(0xFF2E7D32);
      case 'rejected':
        return const Color(0xFFC62828);
      default:
        return AppColors.textSecondary;
    }
  }
}
