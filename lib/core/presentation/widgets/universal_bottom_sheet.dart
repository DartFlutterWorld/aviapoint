import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Универсальный bottom sheet виджет
/// Используется для создания единообразных bottom sheet по всему приложению
class UniversalBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final double? height;
  final VoidCallback? onClose;
  final bool showCloseButton;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const UniversalBottomSheet({super.key, required this.title, required this.child, this.height, this.onClose, this.showCloseButton = true, this.backgroundColor, this.padding});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxHeight = height ?? (screenHeight - 100);

    // Дефолтные значения padding: вертикальный 16, горизонтальный 8
    final defaultHorizontalPadding = 8.0;

    // Разделяем padding на горизонтальный и вертикальный для правильного позиционирования header
    final horizontalPadding = padding?.horizontal ?? defaultHorizontalPadding;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
          color: backgroundColor ?? AppColors.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCloseButton)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 16, right: 8),
                  child: GestureDetector(
                    onTap: onClose ?? () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(Pictures.closeAuth, width: 30.sp, height: 30.sp),
                  ),
                ),
              ),
            // Header с кнопкой закрытия справа
            if (title.isNotEmpty) ...[
              Row(
                children: [
                  Expanded(
                    child: title.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            child: Text(
                              title,
                              style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ],
            SizedBox(height: 16.h),
            // Контент с padding 8 по горизонтали
            // Используем Flexible с fit: FlexFit.loose, чтобы контент мог занимать меньше места
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16.h),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Универсальная функция для показа bottom sheet
Future<T?> showUniversalBottomSheet<T>({
  required BuildContext context,
  required String title,
  required Widget child,
  double? height,
  VoidCallback? onClose,
  bool showCloseButton = true,
  Color? backgroundColor,
  EdgeInsets? padding,
  bool isDismissible = true,
  bool enableDrag = true,
  bool useRootNavigator = true,
  Color? barrierColor,
}) async {
  return await showModalBottomSheet<T>(
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    context: context,
    isScrollControlled: true,
    enableDrag: enableDrag,
    barrierColor: barrierColor ?? AppColors.bgOverlay,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
    builder: (context) => UniversalBottomSheet(title: title, height: height, onClose: onClose, showCloseButton: showCloseButton, backgroundColor: backgroundColor, padding: padding, child: child),
  );
}
