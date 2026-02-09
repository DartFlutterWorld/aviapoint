import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/check_box_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectTopicsTestWidget extends StatelessWidget {
  final List<RosAviaTestCategoryWithQuestionsEntity> categories;
  final Set<int> selectedCategoryId;
  final void Function(int id) onToggle;
  final VoidCallback onToggleAll;

  const SelectTopicsTestWidget({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onToggle,
    required this.onToggleAll,
  });

  @override
  Widget build(BuildContext context) {
    final allIds = categories.map((e) => e.categoryId).toSet();
    final allSelected =
        selectedCategoryId.length == allIds.length && allIds.isNotEmpty && selectedCategoryId.containsAll(allIds);

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F1FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: const Color(0xFF000000).withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Выберите темы тестирования', style: AppStyles.medium14s.copyWith(color: const Color(0xFF223B76))),
            ],
          ),
          SizedBox(height: 14),
          GestureDetector(
            onTap: onToggleAll,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(allSelected ? Pictures.checkBoxActive : Pictures.checkBox, height: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Выбрать все темы',
                        style: AppStyles.regular12s.copyWith(color: const Color(0xFF4B5767)),
                      ),
                    ),
                    Text(
                      '(${categories.fold<int>(0, (sum, cat) => sum + cat.questionCount)})',
                      style: AppStyles.medium10s.copyWith(color: const Color(0xFF9CA5AF)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final active = selectedCategoryId.contains(cat.categoryId);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: CheckBoxRow(
                    title: bigFirstSymbol(cat.categoryTitle),
                    active: active,
                    onTap: () => onToggle(cat.categoryId),
                    questionCount: cat.questionCount.toString(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
