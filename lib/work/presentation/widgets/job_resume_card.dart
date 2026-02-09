import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:flutter/material.dart';

class JobResumeCard extends StatelessWidget {
  final JobResumeEntity resume;
  final VoidCallback? onTap;
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;

  /// Показывать ли чип «Опубликовано»/«Не опубликовано» (только в профиле, не в разделе Работа)
  final bool showPublicationStatus;

  const JobResumeCard({
    super.key,
    required this.resume,
    this.onTap,
    this.isFavorite = false,
    this.onToggleFavorite,
    this.showPublicationStatus = false,
  });

  bool get _isBlockedByAdmin => resume.status.toLowerCase() == 'blocked';

  @override
  Widget build(BuildContext context) {
    final addressText = _buildAddressText();
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.strokeForDarkArea),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showPublicationStatus)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (resume.isVisibleForEmployers)
                            StatusChip(
                              text: 'Опубликовано',
                              backgroundColor: Colors.green.shade600,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              borderRadius: 12,
                            )
                          else
                            StatusChip(
                              text: 'Не опубликовано',
                              backgroundColor: Colors.black.withOpacity(0.7),
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              borderRadius: 12,
                            ),
                        ],
                      ),
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          resume.title,
                          style: AppStyles.bold16s.copyWith(color: AppColors.textPrimary, height: 1.3),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (onToggleFavorite != null) ...[
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 28,
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : AppColors.textSecondary,
                              size: 22,
                            ),
                            onPressed: onToggleFavorite,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                            style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (resume.contactName != null && resume.contactName!.isNotEmpty)
                    Text(
                      resume.contactName!,
                      style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (addressText != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.place, size: 14, color: Color(0xFF9CA5AF)),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            addressText,
                            style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (resume.currentPosition != null && resume.currentPosition!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      resume.currentPosition!,
                      style: AppStyles.regular12s.copyWith(color: AppColors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (resume.desiredSalary != null) ...[
                    const SizedBox(height: 8),
                    Text(_buildSalaryText(), style: AppStyles.bold14s.copyWith(color: AppColors.primary100p)),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (resume.photoUrl != null && resume.photoUrl!.isNotEmpty) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Image.network(
                              getImageUrl(resume.photoUrl!),
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: AppColors.strokeForDarkArea,
                                  child: const Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: AppColors.strokeForDarkArea,
                                child: const Center(child: Icon(Icons.person, size: 28, color: Color(0xFF9CA5AF))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: [
                            if (resume.employmentTypes != null)
                              ..._splitCsv(resume.employmentTypes!).map((e) => _buildChip(_mapEmploymentType(e))),
                            if (resume.schedules != null)
                              ..._splitCsv(resume.schedules!).map((e) => _buildChip(_mapSchedule(e))),
                            if (resume.readyToRelocate == true) _buildChip('Готов к переезду'),
                            if (resume.readyForBusinessTrips == true) _buildChip('Готов к командировкам'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_isBlockedByAdmin)
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Заблокировано администратором',
                        style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _buildSalaryText() {
    final value = resume.desiredSalary!;
    final currency = resume.currency ?? 'RUB';
    return '${_formatMoney(value)} $currency';
  }

  String? _buildAddressText() {
    if (resume.address != null && resume.address!.isNotEmpty) {
      return resume.address;
    }
    return null;
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

  Iterable<String> _splitCsv(String? value) {
    if (value == null || value.isEmpty) return const [];
    return value.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
  }

  Widget _buildChip(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(999)),
          child: Text(text, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
        ),
      ],
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
}
