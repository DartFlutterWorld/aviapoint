import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PreflightInspectionCategoriesScreen extends StatefulWidget {
  final String nameCategory;
  const PreflightInspectionCategoriesScreen({
    super.key,
    @PathParam('nameCategory') required this.nameCategory,
  });

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
        actions: [
          IconButton(
            onPressed: () => context.read<PreflightCheckedCubit>().clearAllCategory(),
            icon: SvgPicture.asset(Pictures.round_clear2),
          ),
        ],
      ),
      backgroundColor: AppColors.newbg,
      body: BlocBuilder<PreflightInspectionCategoriesBloc, PreflightInspectionCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.preflightInspectionCategories),
          loading: (value) => Center(
            child: CircularProgressIndicator(),
          ),
          error: (value) => Center(
            child: Text(value.errorForUser),
          ),
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<PreflightInspectionCategoriesEntity> preflightInspectionCategories;
  const _Success(this.preflightInspectionCategories);

  String getIcon({required BuildContext context, required int index}) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    final checksLenght = BlocProvider.of<PreflightInspectionCheckListBloc>(context).preflightInspectionCheckList.where((e) => e.preflightInspectionCategoryId == index + 1).length;

    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == index + 1,
    );
    if (checkProgressByIdCategory != null) {
      if (checkProgressByIdCategory.checkedIds.length == checksLenght) {
        return Pictures.checkOk;
      }
    }
    return Pictures.strelka;
  }

  void canNavigation({required BuildContext context, required int index}) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    final checksLenght = BlocProvider.of<PreflightInspectionCheckListBloc>(context).preflightInspectionCheckList.where((e) => e.preflightInspectionCategoryId == index + 1).length;

    // Если Выполнено всё то не даём провлиться в катгорию, иначе может провалиться в категорию и закончить проведение проверок
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == index + 1,
    );
    if (checkProgressByIdCategory != null) {
      if (checkProgressByIdCategory.checkedIds.length == checksLenght) {
        return;
      }
    }

    AutoRouter.of(context).push(PreflightInspectionCheckListRoute(
      preflihgtInspectionCategoryId: (preflightInspectionCategories[index].id).toString(),
      nameCategory: preflightInspectionCategories[index].title,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PreflightCheckedCubit, PreflightCheckedState>(
          builder: (context, preflightCheckedState) {
            return ListView.builder(
              clipBehavior: Clip.none,
              itemCount: preflightInspectionCategories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CategoryWidget(
                  title: preflightInspectionCategories[index].title,
                  onTap: () => canNavigation(context: context, index: index),
                  subTitle: preflightInspectionCategories[index].subTitle,
                  picture: preflightInspectionCategories[index].picture,
                  icon: getIcon(context: context, index: index),
                  clearCategory: () {
                    BlocProvider.of<PreflightCheckedCubit>(context).clearCategory(idCategory: preflightInspectionCategories[index].id);
                  },
                  child: ProgressWidget(
                    from: preflightCheckedState.checkProgress.firstWhereOrNull((e) => e.idCategory == index + 1)?.checkedIds.length ?? 0,
                    to: BlocProvider.of<PreflightInspectionCheckListBloc>(context).preflightInspectionCheckList.where((e) => e.preflightInspectionCategoryId == index + 1).length,
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

class ProgressWidget extends StatelessWidget {
  final int from;
  final int to;

  const ProgressWidget({
    super.key,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Выполнено: $from из $to',
      style: AppStyles.caption2,
    );
  }
}
