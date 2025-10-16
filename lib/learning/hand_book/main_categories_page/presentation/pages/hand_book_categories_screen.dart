import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/domain/entities/hand_book_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/bloc/hand_book_main_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/widgets/category_hand_book_long_widget.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/widgets/category_hand_book_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HandBookMainCategoriesScreen extends StatefulWidget {
  const HandBookMainCategoriesScreen({super.key});

  @override
  State<HandBookMainCategoriesScreen> createState() => _HandBookMainCategoriesScreenState();
}

class _HandBookMainCategoriesScreenState extends State<HandBookMainCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HandBookMainCategoriesBloc>(context).add(GetHandBookMainCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Учебное пособие', withBack: true),
      backgroundColor: AppColors.background,
      body: BlocBuilder<HandBookMainCategoriesBloc, HandBookMainCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.handBookCategories),
          loading: (value) => LoadingCustom(),
          error: (value) => ErrorCustom(
            textError: value.errorForUser,
            repeat: () {
              BlocProvider.of<HandBookMainCategoriesBloc>(context).add(GetHandBookMainCategoriesEvent());
            },
          ),
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<HandBookMainCategoriesEntity> handBookCategories;
  const _Success(this.handBookCategories);

  // Выбираем на какую категорию перенаправить пользователя
  PageRouteInfo<Object?> selectSubCategory(int category) {
    switch (category) {
      case 1:
        return PreflightInspectionCategoriesRoute(nameCategory: 'Предполётные процедуры');
      case 2:
        return NormalCategoriesRoute(nameCategory: 'Нормальные процедуры');
      case 3:
        return EmergencyCategoriesRoute(nameCategory: 'Аварийные процедуры');
      default:
    }
    return BaseRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: [
          SizedBox(height: 8),
          CategoryHandBookLongWidget(
            title: handBookCategories[0].title,
            subTitle: handBookCategories[0].subTitle,
            background: Pictures.preflightBackground,
            picturePlane: Pictures.preflightPlane,
            imageHeight: 137.h,
            onTap: () => context.router.push(selectSubCategory(1)),
          ),
          SizedBox(height: 8),
          CategoryHandBookLongWidget(
            title: handBookCategories[1].title,
            subTitle: handBookCategories[1].subTitle,
            background: Pictures.preflightBackground,
            picturePlane: Pictures.normalPlane,
            imageHeight: 130.h,
            onTap: () => context.router.push(selectSubCategory(2)),
          ),
          SizedBox(height: 8),
          Row(
            spacing: 12.w,
            children: [
              Flexible(
                child: CategoryHandBookSmallWidget(
                  height: 190.h,
                  width: 100,
                  title: handBookCategories[3].title,
                  subTitle: handBookCategories[3].subTitle,
                  background: Pictures.limitationBackground,
                  picturePlane: Pictures.limitationPlane,
                  imageHeight: 121.h,
                  onTap: () => context.router.push(selectSubCategory(0)),
                  aligmentPlane: Alignment.bottomLeft,
                ),
              ),
              Flexible(
                child: CategoryHandBookSmallWidget(
                  height: 190.h,
                  width: 100,
                  title: handBookCategories[4].title,
                  subTitle: handBookCategories[4].subTitle,
                  background: Pictures.perfomanceBackground,
                  picturePlane: Pictures.perfomancePlane,
                  imageHeight: 107.h,
                  onTap: () => context.router.push(selectSubCategory(0)),
                  aligmentPlane: Alignment.bottomRight,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          CategoryHandBookLongWidget(
            title: handBookCategories[2].title,
            subTitle: handBookCategories[2].subTitle,
            background: Pictures.preflightBackground,
            picturePlane: Pictures.emergencyPlane,
            imageHeight: 137.h,
            onTap: () => context.router.push(selectSubCategory(3)),
          ),
        ],
      ),
    );
  }
}
