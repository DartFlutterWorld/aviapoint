import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/foundation.dart';

/// Универсальный bottom sheet виджет
/// Используется для создания единообразных bottom sheet по всему приложению
class UniversalBottomSheet extends StatefulWidget {
  final String title;
  final Widget child;
  final double? height;
  final VoidCallback? onClose;
  final bool showCloseButton;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const UniversalBottomSheet({super.key, required this.title, required this.child, this.height, this.onClose, this.showCloseButton = true, this.backgroundColor, this.padding});

  @override
  State<UniversalBottomSheet> createState() => _UniversalBottomSheetState();
}

class _UniversalBottomSheetState extends State<UniversalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // Дефолтные значения padding: вертикальный 16, горизонтальный 8
    final defaultHorizontalPadding = 8.0;

    // Разделяем padding на горизонтальный и вертикальный для правильного позиционирования header
    final horizontalPadding = widget.padding?.horizontal ?? defaultHorizontalPadding;
    final mediaQuery = MediaQuery.of(context);

    return Material(
      type: MaterialType.transparency,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              // Получаем реальную высоту экрана через MediaQuery (обновляется при повороте)
              final screenHeight = MediaQuery.of(context).size.height;

              // Определяем ориентацию через OrientationBuilder
              final isLandscape = orientation == Orientation.landscape;
              // Для портрета: высота экрана - 100, для ландшафта: высота экрана - 20
              // В ландшафте высота экрана меньше, поэтому отнимаем меньше
              final defaultHeight = isLandscape ? (screenHeight - 50) : (screenHeight - 100);
              final maxHeight = widget.height ?? defaultHeight;

              return Container(
                width: double.infinity, // Занимаем всю доступную ширину
                constraints: BoxConstraints(maxHeight: maxHeight),
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, top: 16, bottom: kIsWeb ? 0 : (mediaQuery.viewInsets.bottom + 16 + mediaQuery.padding.bottom)),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (widget.showCloseButton)
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: widget.onClose ?? () => Navigator.of(context).pop(),
                            child: SvgPicture.asset(Pictures.closeAuth, width: 30.0, height: 30.0),
                          ),
                        ),
                      // Header с заголовком
                      if (widget.title.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            widget.title,
                            style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      SizedBox(height: 8),
                      // Контент с прокруткой - используем Flexible для ограничения высоты
                      Flexible(
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(), // Убираем bounce эффект
                          child: widget.child,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
  print('🔵 [showUniversalBottomSheet] Вызван, title: $title');
  print('🔵 [showUniversalBottomSheet] context.mounted: ${context.mounted}');
  print('🔵 [showUniversalBottomSheet] kIsWeb: $kIsWeb');
  print('🔵 [showUniversalBottomSheet] useRootNavigator: $useRootNavigator');

  try {
    // На веб-платформе используем showModalBottomSheet, так как showCupertinoModalBottomSheet может не работать
    if (kIsWeb) {
      print('🔵 [showUniversalBottomSheet] Веб-платформа, использую showModalBottomSheet');
      final screenHeight = MediaQuery.of(context).size.height;
      final defaultHeight = screenHeight - 100;
      final maxHeight = height ?? defaultHeight;

      return await showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: Colors.transparent,
        barrierColor: barrierColor ?? AppColors.bgOverlay,
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
        builder: (context) {
          print('🔵 [showUniversalBottomSheet] Builder вызван (веб)');
          // На веб используем ширину экрана, но ограничиваем максимумом 1400px (вся ширина сайта)
          final screenWidth = MediaQuery.of(context).size.width;
          final maxSiteWidth = 1400.0; // Вся ширина сайта (200px сайдбар + 1200px контент)
          final bottomSheetWidth = screenWidth > maxSiteWidth ? maxSiteWidth : screenWidth;

          // Убираем отступ снизу, который добавляет showModalBottomSheet
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: BoxConstraints(maxWidth: bottomSheetWidth),
                child: UniversalBottomSheet(title: title, height: maxHeight, onClose: onClose, showCloseButton: showCloseButton, backgroundColor: backgroundColor, padding: padding, child: child),
              ),
            ),
          );
        },
      );
    }

    // На мобильных платформах используем showCupertinoModalBottomSheet
    print('🔵 [showUniversalBottomSheet] Мобильная платформа, вызываю showCupertinoModalBottomSheet...');
    final result = await showCupertinoModalBottomSheet<T>(
      context: context,
      barrierColor: barrierColor ?? AppColors.bgOverlay,
      topRadius: Radius.circular(18),
      backgroundColor: Colors.transparent,
      expand: false,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) {
        print('🔵 [showUniversalBottomSheet] Builder вызван');
        // Используем Builder, чтобы виджет перестраивался при изменении MediaQuery
        return Builder(
          builder: (builderContext) {
            print('🔵 [showUniversalBottomSheet] BuilderContext создан');
            // MediaQuery.of(builderContext) будет обновляться при повороте экрана
            return UniversalBottomSheet(title: title, height: height, onClose: onClose, showCloseButton: showCloseButton, backgroundColor: backgroundColor, padding: padding, child: child);
          },
        );
      },
    );
    print('🔵 [showUniversalBottomSheet] showCupertinoModalBottomSheet завершен, result: $result');
    return result;
  } catch (e, stackTrace) {
    print('❌ [showUniversalBottomSheet] Ошибка: $e');
    print('❌ [showUniversalBottomSheet] StackTrace: $stackTrace');
    rethrow;
  }
}
