import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/presentation/bloc/emergency_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EmergencyCategoriesScreen extends StatefulWidget {
  const EmergencyCategoriesScreen({super.key});

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
        title: 'Аварийные процедуры',
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<EmergencyCategoriesBloc, EmergencyCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.emergencyCategories),
          loading: (value) => LoadingCustom(),
          error: (value) => ErrorCustom(
            textError: value.errorForUser,
            repeat: () {
              BlocProvider.of<EmergencyCategoriesBloc>(context).add(GetEmergencyCategoriesEvent());
            },
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
      case 9:
        return ElectricalPowerSubCategoryRoute(nameCategory: 'Неисправности системы электроснабжения');
      case 10:
        return AirDataSystemFailureRoute();
      case 11:
        return AttitudeAndHeadingReferenceSystemAhrsFailureRoute();
      case 12:
        return AutopilotOrElectricTrimFailureRoute();
      case 13:
        return DisplayCoolingAdvisoryRoute();
      case 14:
        return VacuumSystemFailureRoute();
      case 15:
        return HighCarbonMonoxideCoLevelAdvisoryRoute();
      default:
    }
    return BaseRoute();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemCount: emergencyCategories.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: CategoryWidget(
              title: bigFirstSymbol(emergencyCategories[index].title),
              onTap: () => context.router.push(navigateToCategory(index + 1)),
              subTitle: bigFirstSymbol(emergencyCategories[index].subTitle),
              clearCategory: () {},
              withClear: false,
            ),
          ),
        ),
      ),
    );
  }
}
