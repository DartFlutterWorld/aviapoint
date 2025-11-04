import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/domain/entities/normal_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/presentation/bloc/normal_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/widgets/progress_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NormalCategoriesScreen extends StatefulWidget {
  final String nameCategory;
  const NormalCategoriesScreen({super.key, @PathParam('nameCategory') required this.nameCategory});

  @override
  State<NormalCategoriesScreen> createState() => _NormalCategoriesScreenState();
}

class _NormalCategoriesScreenState extends State<NormalCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NormalCategoriesBloc>(context).add(GetNormalCategoriesEvent());
    BlocProvider.of<NormalCheckListBloc>(context).add(GetNormalCheckListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nameCategory,
        withBack: true,
        actions: [IconButton(onPressed: () => context.read<NormalCheckedCubit>().clearAllCategory(), icon: SvgPicture.asset(Pictures.round_clear2))],
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<NormalCategoriesBloc, NormalCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.normalCategories),
          loading: (value) => LoadingCustom(),
          error: (value) => ErrorCustom(
            textError: value.errorForUser,
            repeat: () {
              BlocProvider.of<NormalCategoriesBloc>(context).add(GetNormalCategoriesEvent());
              BlocProvider.of<NormalCheckListBloc>(context).add(GetNormalCheckListEvent());
            },
          ),
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<NormalCategoriesEntity> normalCategories;
  const _Success(this.normalCategories);

  String getIcon({required BuildContext context, required int index}) {
    final state = BlocProvider.of<NormalCheckedCubit>(context).state;
    final checksLenght = BlocProvider.of<NormalCheckListBloc>(context).normalCheckList.where((e) => e.normalCategoryId == index + 1 && e.checkList == false).length;

    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1);
    if (checkProgressByIdCategory != null) {
      if (checkProgressByIdCategory.checkedIds.length == checksLenght) {
        return Pictures.checkOk;
      }
    }
    return Pictures.strelka;
  }

  void canNavigation({required BuildContext context, required int index}) {
    final state = BlocProvider.of<NormalCheckedCubit>(context).state;
    final checksLenght = BlocProvider.of<NormalCheckListBloc>(context).normalCheckList.where((e) => e.normalCategoryId == index + 1 && e.checkList == false).length;

    // Если Выполнено всё то не даём провлиться в катгорию, иначе может провалиться в категорию и закончить проведение проверок
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1);
    if (checkProgressByIdCategory != null) {
      if (checkProgressByIdCategory.checkedIds.length == checksLenght) {
        return;
      }
    }

    AutoRouter.of(context).push(NormalCheckListRoute(normalCategoryId: (normalCategories[index].id).toString(), nameCategory: normalCategories[index].title));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: BlocBuilder<NormalCheckedCubit, NormalCheckedState>(
          builder: (context, normalCheckedState) {
            return ListView.builder(
              clipBehavior: Clip.none,
              itemCount: normalCategories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CategoryWidget(
                  title: normalCategories[index].title,
                  onTap: () => canNavigation(context: context, index: index),
                  subTitle: normalCategories[index].subTitle,
                  clearCategory: () {
                    BlocProvider.of<NormalCheckedCubit>(context).clearCategory(idCategory: normalCategories[index].id);
                  },
                  child: BlocBuilder<NormalCheckListBloc, NormalCheckListState>(
                    builder: (context, state) => state.maybeMap(
                      success: (value) => ProgressWidget(
                        from: normalCheckedState.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1)?.checkedIds.length ?? 0,
                        to: BlocProvider.of<NormalCheckListBloc>(context).normalCheckList.where((e) => e.normalCategoryId == index + 1 && e.checkList == false).length,
                      ),
                      orElse: () => SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
