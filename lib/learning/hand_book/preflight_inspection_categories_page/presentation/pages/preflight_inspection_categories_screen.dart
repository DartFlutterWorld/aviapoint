import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/clear_progress.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottomSheets.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/normal_categories_page/presentation/pages/normal_categories_screen.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/widgets/progress_widget.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PreflightInspectionCategoriesScreen extends StatefulWidget {
  final String nameCategory;
  const PreflightInspectionCategoriesScreen({super.key, @PathParam('nameCategory') required this.nameCategory});

  @override
  State<PreflightInspectionCategoriesScreen> createState() => _PreflightInspectionCategoriesScreenState();
}

class _PreflightInspectionCategoriesScreenState extends State<PreflightInspectionCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PreflightInspectionCategoriesBloc>(context).add(GetPreflightInspectionCategoriesEvent());
    BlocProvider.of<PreflightInspectionCheckListBloc>(context).add(GetPreflightInspectionCheckListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nameCategory,
        withBack: true,
        actions: [IconButton(onPressed: () => context.read<PreflightCheckedCubit>().clearAllCategory(), icon: SvgPicture.asset(Pictures.round_clear2))],
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<PreflightInspectionCategoriesBloc, PreflightInspectionCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.preflightInspectionCategories),
          error: (value) => ErrorCustom(
            textError: value.errorForUser,
            repeat: () {
              BlocProvider.of<PreflightInspectionCategoriesBloc>(context).add(GetPreflightInspectionCategoriesEvent());
              BlocProvider.of<PreflightInspectionCheckListBloc>(context).add(GetPreflightInspectionCheckListEvent());
            },
          ),
          loading: (value) => LoadingCustom(),
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<PreflightInspectionCategoriesEntity> preflightInspectionCategories;
  const _Success(this.preflightInspectionCategories);

  bool getIcon({required BuildContext context, required int index}) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    final checksLenght = BlocProvider.of<PreflightInspectionCheckListBloc>(context).preflightInspectionCheckList.where((e) => e.preflightInspectionCategoryId == index + 1).length;

    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1);
    if (checkProgressByIdCategory != null) {
      if (checkProgressByIdCategory.checkedIds.length == checksLenght) {
        return true;
      }
    }
    return false;
  }

  void canNavigation({required BuildContext context, required int index}) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    final checksLenght = BlocProvider.of<PreflightInspectionCheckListBloc>(context).preflightInspectionCheckList.where((e) => e.preflightInspectionCategoryId == index + 1).length;

    // Если Выполнено всё то не даём провлиться в катгорию, иначе может провалиться в категорию и закончить проведение проверок
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1);
    if (checkProgressByIdCategory != null) {
      if (checkProgressByIdCategory.checkedIds.length == checksLenght) {
        return;
      }
    }

    AutoRouter.of(context).push(PreflightInspectionCheckListRoute(preflihgtInspectionCategoryId: (preflightInspectionCategories[index].id).toString()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: BlocBuilder<PreflightCheckedCubit, PreflightCheckedState>(
          builder: (context, preflightCheckedState) {
            return ListView.builder(
              clipBehavior: Clip.none,
              itemCount: preflightInspectionCategories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CategoryWidget(
                  title: preflightInspectionCategories[index].title,
                  onTap: () => canNavigation(context: context, index: index),
                  subTitle: preflightInspectionCategories[index].subTitle,
                  withClear: preflightCheckedState.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1)?.checkedIds.isNotEmpty ?? false,
                  clearCategory: () async {
                    final bool? result = await showDialogCustom(context: context);
                    if (result == true) {
                      BlocProvider.of<PreflightCheckedCubit>(context).clearCategory(idCategory: preflightInspectionCategories[index].id);
                    }
                  },
                  child: BlocBuilder<PreflightInspectionCheckListBloc, PreflightInspectionCheckListState>(
                    builder: (context, state) => state.maybeMap(
                      success: (value) => ProgressWidget(
                        from: preflightCheckedState.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1)?.checkedIds.length ?? 0,
                        to: BlocProvider.of<PreflightInspectionCheckListBloc>(context).preflightInspectionCheckList.where((e) => e.preflightInspectionCategoryId == index + 1).length,
                      ),
                      orElse: () => SizedBox(),
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
