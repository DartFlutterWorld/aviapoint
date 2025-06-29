import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/bloc/emergency_categories_bloc.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/engine_failure/engine_failure_screen.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/pages/forced_landings/forced_landings_sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EmergencyCategoriesScreen extends StatefulWidget {
  final String nameCategory;
  const EmergencyCategoriesScreen({
    super.key,
    @PathParam('nameCategory') required this.nameCategory,
  });

  @override
  State<EmergencyCategoriesScreen> createState() => _EmergencyCategoriesScreenState();
}

class _EmergencyCategoriesScreenState extends State<EmergencyCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EmergencyCategoriesBloc>(context).add(GetEmergencyCategoriesEvent());
    // BlocProvider.of<EmergencyCheckListBloc>(context).add(GetEmergencyCheckListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nameCategory,
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
      ),
      backgroundColor: AppColors.newbg,
      body: BlocBuilder<EmergencyCategoriesBloc, EmergencyCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.emergencyCategories),
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
  final List<EmergencyCategoriesEntity> emergencyCategories;
  const _Success(this.emergencyCategories);

  PageRouteInfo<Object?> navigateToCategory(int category) {
    switch (category) {
      case 1:
        return AirspeedsForEmergencyOperationsRoute();
      case 2:
        return EngineFailureRoute();
      case 3:
        return ForcedLandingsSubCategoriesRoute(nameCategory: 'Вынужденная посадка');
      case 4:
        return FiresSubCategoriesRoute(nameCategory: 'Пожар');
      case 5:
        return IcingRoute();
      case 6:
        return StaticSourceBlockageRoute();
      case 7:
        return ExcessiveFuelVaporRoute();
      case 8:
        return AbnormalLandingsRoute();
      default:
        print("число не равно 1, 2, 3");
    }
    return BaseRoute();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemCount: emergencyCategories.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CategoryWidget(
              title: capitalizeSentence(emergencyCategories[index].title),
              onTap: () => context.router.push(navigateToCategory(index + 1)),
              subTitle: capitalizeSentence(emergencyCategories[index].subTitle),
              picture: emergencyCategories[index].picture,
              icon: Pictures.strelka,
              clearCategory: () {},
            ),
          ),
        ),
      ),
    );
  }
}
