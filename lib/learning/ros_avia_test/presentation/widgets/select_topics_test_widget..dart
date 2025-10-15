import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/check_box_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SelectTopicsTestWidget extends StatelessWidget {
  final List<RosAviaTestCategoryEntity> categories;
  final Set<int> selectedCategoryId;
  final void Function(int id) onToggle;
  final VoidCallback onToggleAll;

  const SelectTopicsTestWidget({super.key, required this.categories, required this.selectedCategoryId, required this.onToggle, required this.onToggleAll});

  @override
  Widget build(BuildContext context) {
    print('SelectTopicsTestWidget: categories=${categories.map((e) => e.id).toList()}');
    print('SelectTopicsTestWidget: selectedCategoryId=$selectedCategoryId');
    final allSelected = selectedCategoryId.length == categories.length && categories.isNotEmpty;

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F1FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: const Color(0xFF000000).withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Выберите темы тестирования', style: AppStyles.medium14s.copyWith(color: const Color(0xFF223B76)))],
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: onToggleAll,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Row(
                children: [
                  SvgPicture.asset(allSelected ? Pictures.checkBoxActive : Pictures.checkBox),
                  SizedBox(width: 8.w),
                  Text('Выбрать все темы', style: AppStyles.regular12s.copyWith(color: const Color(0xFF4B5767))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final active = selectedCategoryId.contains(cat.id);
                return CheckBoxRow(title: bigFirstSymbol(cat.title), active: active, onTap: () => onToggle(cat.id));
              },
            ),
          ),
        ],
      ),
    );
  }
}
