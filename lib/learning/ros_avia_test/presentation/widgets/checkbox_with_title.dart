import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckboxWithTitle extends StatelessWidget {
  final VoidCallback onToggleMixAnswers;
  final VoidCallback onToggleMixQuestions;
  final VoidCallback onToggleButtonHint;
  final bool isSelectMixAnswers;
  final bool isSelectMixQuestions;
  final bool isSelectButtonHint;
  final bool hasActiveSubscription;
  final VoidCallback? onSubscribeTap;

  const CheckboxWithTitle({
    super.key,
    required this.isSelectMixAnswers,
    required this.isSelectMixQuestions,
    required this.isSelectButtonHint,
    required this.onToggleMixAnswers,
    required this.onToggleButtonHint,
    required this.onToggleMixQuestions,
    this.hasActiveSubscription = true,
    this.onSubscribeTap,
  });

  void _handleSubscribeTap(BuildContext context) {
    print('🔵 [CheckboxWithTitle] _handleSubscribeTap вызван');
    print('🔵 [CheckboxWithTitle] onSubscribeTap is null: ${onSubscribeTap == null}');
    print('🔵 [CheckboxWithTitle] context.mounted: ${context.mounted}');
    
    // Используем небольшую задержку, чтобы убедиться, что UI готов
    Future.microtask(() {
      if (onSubscribeTap != null) {
        print('🔵 [CheckboxWithTitle] Вызываю onSubscribeTap');
        try {
          onSubscribeTap!();
        } catch (e, stackTrace) {
          print('❌ [CheckboxWithTitle] Ошибка при вызове onSubscribeTap: $e');
          print('❌ [CheckboxWithTitle] StackTrace: $stackTrace');
        }
      } else {
        print('❌ [CheckboxWithTitle] onSubscribeTap is null');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !hasActiveSubscription;
    
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F1FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: const Color(0xFF000000).withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Настройки', style: AppStyles.medium14s.copyWith(color: const Color(0xFF223B76))),
                if (isDisabled && onSubscribeTap != null)
                  GestureDetector(
                    onTap: () {
                      print('🔵 [CheckboxWithTitle] GestureDetector onTap вызван');
                      _handleSubscribeTap(context);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Text(
                        'Доступно при подписке 1000р/год',
                        style: AppStyles.regular12s.copyWith(
                          color: const Color(0xFF0A6EFA),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
              ],
          ),
          SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ColorFiltered(
              colorFilter: isDisabled
                  ? ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.saturation)
                  : const ColorFilter.mode(Colors.transparent, BlendMode.color),
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                          onTap: isDisabled ? null : onToggleMixAnswers,
                      child: Row(
                        children: [
                              SvgPicture.asset(
                                isSelectMixAnswers ? Pictures.checkBoxActive : Pictures.checkBox,
                                colorFilter: isDisabled
                                    ? const ColorFilter.mode(Color(0xFFA19F9F), BlendMode.srcIn)
                                    : null,
                              ),
                          SizedBox(width: 8),
                              Text(
                                'Перемешать ответы',
                                style: AppStyles.regular12s.copyWith(
                                  color: isDisabled ? const Color(0xFFA19F9F) : const Color(0xFF4B5767),
                                ),
                              ),
                        ],
                      ),
                    ),
                    GestureDetector(
                          onTap: isDisabled ? null : onToggleButtonHint,
                      child: Row(
                        children: [
                              SvgPicture.asset(
                                isSelectButtonHint ? Pictures.checkBoxActive : Pictures.checkBox,
                                colorFilter: isDisabled
                                    ? const ColorFilter.mode(Color(0xFFA19F9F), BlendMode.srcIn)
                                    : null,
                              ),
                          SizedBox(width: 8),
                              Text(
                                'Показывать обоснование',
                                style: AppStyles.regular12s.copyWith(
                                  color: isDisabled ? const Color(0xFFA19F9F) : const Color(0xFF4B5767),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                          onTap: isDisabled ? null : onToggleMixQuestions,
                      child: Row(
                        children: [
                              SvgPicture.asset(
                                isSelectMixQuestions ? Pictures.checkBoxActive : Pictures.checkBox,
                                colorFilter: isDisabled
                                    ? const ColorFilter.mode(Color(0xFFA19F9F), BlendMode.srcIn)
                                    : null,
                              ),
                          SizedBox(width: 8),
                              Text(
                                'Перемешать вопросы',
                                style: AppStyles.regular12s.copyWith(
                                  color: isDisabled ? const Color(0xFFA19F9F) : const Color(0xFF4B5767),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
