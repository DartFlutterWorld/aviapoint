import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> checkList({required BuildContext context, required List<NormalCheckListEntity> checkList}) async {
  return await showModalBottomSheet<void>(
    useRootNavigator: true,
    isDismissible: false,
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    barrierColor: AppColors.bgOverlay,
    backgroundColor: AppColors.newbg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10.r),
      ),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 24),
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Карта контрольных проверок',
                textAlign: TextAlign.center,
                style: AppStyles.bigButtonCulture.copyWith(fontSize: 22),
              ),
              Table(border: TableBorder.all(width: 0.5), children: [
                ...checkList.map((e) => TableRow(decoration: BoxDecoration(color: e.id.floor().isEven ? Colors.grey[200] : Colors.transparent), children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(e.title),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(e.doing),
                      )
                    ])),
              ]),
              CustomButton(
                title: 'Ok',
                textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp, height: 1, color: AppColors.mainSolid),
                borderColor: Colors.blue,
                onPressed: () => context.router.maybePop(),
              )
            ],
          ),
        ),
      );
    },
  );
}
