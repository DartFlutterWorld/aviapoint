import 'package:aviapoint/core/presentation/widgets/status_chip.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:flutter/material.dart';

class JobVacancyCard extends StatelessWidget {
  final JobVacancyEntity vacancy;
  final VoidCallback? onTap;

  /// Показывать ли иконку избранного. [isFavorite] — в режиме «только избранное» все элементы считаются избранными.
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;

  /// Показывать ли чип «Опубликовано»/«Не опубликовано» (только в профиле, не в разделе Работа)
  final bool showPublicationStatus;

  const JobVacancyCard({super.key, required this.vacancy, this.onTap, this.isFavorite = false, this.onToggleFavorite, this.showPublicationStatus = false});

  @override
  Widget build(BuildContext context) {
    final salaryText = _buildSalaryText();
    final locationText = _buildLocationText();

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
                          if (vacancy.isPublished)
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
                  if (vacancy.userHasResponded == true)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StatusChip(
                            text: 'Отклик отправлен',
                            backgroundColor: AppColors.primary100p,
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
                          vacancy.title,
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
                            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : AppColors.textSecondary, size: 22),
                            onPressed: onToggleFavorite,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                            style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (salaryText != null) ...[const SizedBox(height: 6), _buildSalaryRow()],
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    alignment: WrapAlignment.start,
                    children: [
                      if (vacancy.employmentType != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StatusChip(
                              text: _mapEmploymentType(vacancy.employmentType!),
                              backgroundColor: const Color(0xFFE5F0FF),
                              textColor: AppColors.textPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              borderRadius: 999,
                            ),
                          ],
                        ),
                      if (vacancy.schedule != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StatusChip(
                              text: _mapSchedule(vacancy.schedule!),
                              backgroundColor: const Color(0xFFF3F4F6),
                              textColor: AppColors.textPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              borderRadius: 999,
                            ),
                          ],
                        ),
                      if (vacancy.experienceLevel != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StatusChip(
                              text: _mapExperience(vacancy.experienceLevel!),
                              backgroundColor: const Color(0xFFF3F4F6),
                              textColor: AppColors.textPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              borderRadius: 999,
                            ),
                          ],
                        ),
                    ],
                  ),
                  if (_buildContactName() != null || locationText != null) ...[
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (vacancy.logoUrl != null && vacancy.logoUrl!.isNotEmpty) ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              getImageUrl(vacancy.logoUrl!),
                              width: 44,
                              height: 44,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(width: 44, height: 44, color: Colors.grey.shade200, child: const Icon(Icons.business, size: 22)),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_buildContactName() != null)
                                Text(
                                  _buildContactName()!,
                                  style: AppStyles.regular13s.copyWith(color: AppColors.textPrimary),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              if (locationText != null) ...[
                                if (_buildContactName() != null) const SizedBox(height: 2),
                                Row(
                                  children: [
                                    const Icon(Icons.place, size: 12, color: Color(0xFF9CA5AF)),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        locationText,
                                        style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (!vacancy.isActive)
              Container(
                height: 235,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.35), borderRadius: BorderRadius.circular(12)),

                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: Colors.red.withOpacity(0.8), borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Заблокировано администратором',
                    style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String? _buildSalaryText() {
    if (vacancy.salaryFrom == null && vacancy.salaryTo == null) return null;

    final from = vacancy.salaryFrom;
    final to = vacancy.salaryTo;

    String range;
    if (from != null && to != null) {
      range = '${_formatMoney(from)} – ${_formatMoney(to)}';
    } else if (from != null) {
      range = 'от ${_formatMoney(from)}';
    } else {
      range = 'до ${_formatMoney(to!)}';
    }
    return range;
  }

  String _currencySymbol() {
    switch (vacancy.currency?.toUpperCase() ?? 'RUB') {
      case 'RUB':
        return '₽';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      default:
        return vacancy.currency ?? '₽';
    }
  }

  Widget _buildSalaryRow() {
    final range = _buildSalaryText();
    if (range == null) return const SizedBox.shrink();

    final symbol = _currencySymbol();
    final isGross = vacancy.isGross == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(range, style: AppStyles.bold14s.copyWith(color: AppColors.primary100p)),
            const SizedBox(width: 4),
            Text(symbol, style: AppStyles.bold14s.copyWith(color: AppColors.primary100p)),
          ],
        ),
        if (isGross) ...[const SizedBox(height: 2), Text('до вычета налогов', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary))],
      ],
    );
  }

  String? _buildLocationText() {
    if (vacancy.address == null || vacancy.address!.isEmpty) return null;
    return vacancy.address;
  }

  String? _buildContactName() {
    if (vacancy.isPrivate == true) return 'Частное лицо';
    if (vacancy.companyName != null && vacancy.companyName!.isNotEmpty) {
      return vacancy.companyName;
    }
    if (vacancy.contactName != null && vacancy.contactName!.isNotEmpty) {
      return vacancy.contactName;
    }
    if (vacancy.employerFirstName != null || vacancy.employerLastName != null) {
      final fallback = '${vacancy.employerFirstName ?? ''} ${vacancy.employerLastName ?? ''}'.trim();
      if (fallback.isNotEmpty) return fallback;
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
        return 'Опыт 1–3 года';
      case '3_6':
        return 'Опыт 3–6 лет';
      case '6_plus':
        return 'Опыт 6+ лет';
      default:
        return value;
    }
  }
}
