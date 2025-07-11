// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AbnormalLandingsScreen]
class AbnormalLandingsRoute extends PageRouteInfo<void> {
  const AbnormalLandingsRoute({List<PageRouteInfo>? children})
    : super(AbnormalLandingsRoute.name, initialChildren: children);

  static const String name = 'AbnormalLandingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AbnormalLandingsScreen();
    },
  );
}

/// generated route for
/// [AirDataSystemFailureScreen]
class AirDataSystemFailureRoute extends PageRouteInfo<void> {
  const AirDataSystemFailureRoute({List<PageRouteInfo>? children})
    : super(AirDataSystemFailureRoute.name, initialChildren: children);

  static const String name = 'AirDataSystemFailureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AirDataSystemFailureScreen();
    },
  );
}

/// generated route for
/// [AirspeedsForEmergencyOperationsScreen]
class AirspeedsForEmergencyOperationsRoute extends PageRouteInfo<void> {
  const AirspeedsForEmergencyOperationsRoute({List<PageRouteInfo>? children})
    : super(
        AirspeedsForEmergencyOperationsRoute.name,
        initialChildren: children,
      );

  static const String name = 'AirspeedsForEmergencyOperationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AirspeedsForEmergencyOperationsScreen();
    },
  );
}

/// generated route for
/// [AttitudeAndHeadingReferenceSystemAhrsFailureScreen]
class AttitudeAndHeadingReferenceSystemAhrsFailureRoute
    extends PageRouteInfo<void> {
  const AttitudeAndHeadingReferenceSystemAhrsFailureRoute({
    List<PageRouteInfo>? children,
  }) : super(
         AttitudeAndHeadingReferenceSystemAhrsFailureRoute.name,
         initialChildren: children,
       );

  static const String name =
      'AttitudeAndHeadingReferenceSystemAhrsFailureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AttitudeAndHeadingReferenceSystemAhrsFailureScreen();
    },
  );
}

/// generated route for
/// [AutopilotOrElectricTrimFailureScreen]
class AutopilotOrElectricTrimFailureRoute extends PageRouteInfo<void> {
  const AutopilotOrElectricTrimFailureRoute({List<PageRouteInfo>? children})
    : super(
        AutopilotOrElectricTrimFailureRoute.name,
        initialChildren: children,
      );

  static const String name = 'AutopilotOrElectricTrimFailureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AutopilotOrElectricTrimFailureScreen();
    },
  );
}

/// generated route for
/// [BaseScreen]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
    : super(BaseRoute.name, initialChildren: children);

  static const String name = 'BaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseScreen();
    },
  );
}

/// generated route for
/// [CabinFireScreen]
class CabinFireRoute extends PageRouteInfo<void> {
  const CabinFireRoute({List<PageRouteInfo>? children})
    : super(CabinFireRoute.name, initialChildren: children);

  static const String name = 'CabinFireRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CabinFireScreen();
    },
  );
}

/// generated route for
/// [DisplayCoolingAdvisoryScreen]
class DisplayCoolingAdvisoryRoute extends PageRouteInfo<void> {
  const DisplayCoolingAdvisoryRoute({List<PageRouteInfo>? children})
    : super(DisplayCoolingAdvisoryRoute.name, initialChildren: children);

  static const String name = 'DisplayCoolingAdvisoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DisplayCoolingAdvisoryScreen();
    },
  );
}

/// generated route for
/// [DitchingScreen]
class DitchingRoute extends PageRouteInfo<void> {
  const DitchingRoute({List<PageRouteInfo>? children})
    : super(DitchingRoute.name, initialChildren: children);

  static const String name = 'DitchingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DitchingScreen();
    },
  );
}

/// generated route for
/// [ElectricalFireInFlightScreen]
class ElectricalFireInFlightRoute extends PageRouteInfo<void> {
  const ElectricalFireInFlightRoute({List<PageRouteInfo>? children})
    : super(ElectricalFireInFlightRoute.name, initialChildren: children);

  static const String name = 'ElectricalFireInFlightRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ElectricalFireInFlightScreen();
    },
  );
}

/// generated route for
/// [ElectricalPowerSubCategoryScreen]
class ElectricalPowerSubCategoryRoute
    extends PageRouteInfo<ElectricalPowerSubCategoryRouteArgs> {
  ElectricalPowerSubCategoryRoute({
    Key? key,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         ElectricalPowerSubCategoryRoute.name,
         args: ElectricalPowerSubCategoryRouteArgs(
           key: key,
           nameCategory: nameCategory,
         ),
         rawPathParams: {'nameCategory': nameCategory},
         initialChildren: children,
       );

  static const String name = 'ElectricalPowerSubCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ElectricalPowerSubCategoryRouteArgs>(
        orElse:
            () => ElectricalPowerSubCategoryRouteArgs(
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return ElectricalPowerSubCategoryScreen(
        key: args.key,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class ElectricalPowerSubCategoryRouteArgs {
  const ElectricalPowerSubCategoryRouteArgs({
    this.key,
    required this.nameCategory,
  });

  final Key? key;

  final String nameCategory;

  @override
  String toString() {
    return 'ElectricalPowerSubCategoryRouteArgs{key: $key, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [ElectricalPowerSupplySystemMalfunctionsScreen]
class ElectricalPowerSupplySystemMalfunctionsRoute extends PageRouteInfo<void> {
  const ElectricalPowerSupplySystemMalfunctionsRoute({
    List<PageRouteInfo>? children,
  }) : super(
         ElectricalPowerSupplySystemMalfunctionsRoute.name,
         initialChildren: children,
       );

  static const String name = 'ElectricalPowerSupplySystemMalfunctionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ElectricalPowerSupplySystemMalfunctionsScreen();
    },
  );
}

/// generated route for
/// [EmergencyCategoriesScreen]
class EmergencyCategoriesRoute
    extends PageRouteInfo<EmergencyCategoriesRouteArgs> {
  EmergencyCategoriesRoute({
    Key? key,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         EmergencyCategoriesRoute.name,
         args: EmergencyCategoriesRouteArgs(
           key: key,
           nameCategory: nameCategory,
         ),
         rawPathParams: {'nameCategory': nameCategory},
         initialChildren: children,
       );

  static const String name = 'EmergencyCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EmergencyCategoriesRouteArgs>(
        orElse:
            () => EmergencyCategoriesRouteArgs(
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return EmergencyCategoriesScreen(
        key: args.key,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class EmergencyCategoriesRouteArgs {
  const EmergencyCategoriesRouteArgs({this.key, required this.nameCategory});

  final Key? key;

  final String nameCategory;

  @override
  String toString() {
    return 'EmergencyCategoriesRouteArgs{key: $key, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [EmergencyLandingWithEnginePowerScreen]
class EmergencyLandingWithEnginePowerRoute extends PageRouteInfo<void> {
  const EmergencyLandingWithEnginePowerRoute({List<PageRouteInfo>? children})
    : super(
        EmergencyLandingWithEnginePowerRoute.name,
        initialChildren: children,
      );

  static const String name = 'EmergencyLandingWithEnginePowerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmergencyLandingWithEnginePowerScreen();
    },
  );
}

/// generated route for
/// [EmergencyLandingWithoutEnginePowerScreen]
class EmergencyLandingWithoutEnginePowerRoute extends PageRouteInfo<void> {
  const EmergencyLandingWithoutEnginePowerRoute({List<PageRouteInfo>? children})
    : super(
        EmergencyLandingWithoutEnginePowerRoute.name,
        initialChildren: children,
      );

  static const String name = 'EmergencyLandingWithoutEnginePowerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmergencyLandingWithoutEnginePowerScreen();
    },
  );
}

/// generated route for
/// [EmptyNavigationScreen]
class EmptyNavigationRoute extends PageRouteInfo<void> {
  const EmptyNavigationRoute({List<PageRouteInfo>? children})
    : super(EmptyNavigationRoute.name, initialChildren: children);

  static const String name = 'EmptyNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmptyNavigationScreen();
    },
  );
}

/// generated route for
/// [EngineFailureScreen]
class EngineFailureRoute extends PageRouteInfo<void> {
  const EngineFailureRoute({List<PageRouteInfo>? children})
    : super(EngineFailureRoute.name, initialChildren: children);

  static const String name = 'EngineFailureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EngineFailureScreen();
    },
  );
}

/// generated route for
/// [EngineFireInFlightScreen]
class EngineFireInFlightRoute extends PageRouteInfo<void> {
  const EngineFireInFlightRoute({List<PageRouteInfo>? children})
    : super(EngineFireInFlightRoute.name, initialChildren: children);

  static const String name = 'EngineFireInFlightRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EngineFireInFlightScreen();
    },
  );
}

/// generated route for
/// [ExcessiveFuelVaporScreen]
class ExcessiveFuelVaporRoute extends PageRouteInfo<void> {
  const ExcessiveFuelVaporRoute({List<PageRouteInfo>? children})
    : super(ExcessiveFuelVaporRoute.name, initialChildren: children);

  static const String name = 'ExcessiveFuelVaporRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExcessiveFuelVaporScreen();
    },
  );
}

/// generated route for
/// [FiresDuringStartOnGroundScreen]
class FiresDuringStartOnGroundRoute extends PageRouteInfo<void> {
  const FiresDuringStartOnGroundRoute({List<PageRouteInfo>? children})
    : super(FiresDuringStartOnGroundRoute.name, initialChildren: children);

  static const String name = 'FiresDuringStartOnGroundRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FiresDuringStartOnGroundScreen();
    },
  );
}

/// generated route for
/// [FiresSubCategoriesScreen]
class FiresSubCategoriesRoute
    extends PageRouteInfo<FiresSubCategoriesRouteArgs> {
  FiresSubCategoriesRoute({
    Key? key,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         FiresSubCategoriesRoute.name,
         args: FiresSubCategoriesRouteArgs(
           key: key,
           nameCategory: nameCategory,
         ),
         rawPathParams: {'nameCategory': nameCategory},
         initialChildren: children,
       );

  static const String name = 'FiresSubCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FiresSubCategoriesRouteArgs>(
        orElse:
            () => FiresSubCategoriesRouteArgs(
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return FiresSubCategoriesScreen(
        key: args.key,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class FiresSubCategoriesRouteArgs {
  const FiresSubCategoriesRouteArgs({this.key, required this.nameCategory});

  final Key? key;

  final String nameCategory;

  @override
  String toString() {
    return 'FiresSubCategoriesRouteArgs{key: $key, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [ForcedLandingsSubCategoriesScreen]
class ForcedLandingsSubCategoriesRoute
    extends PageRouteInfo<ForcedLandingsSubCategoriesRouteArgs> {
  ForcedLandingsSubCategoriesRoute({
    Key? key,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         ForcedLandingsSubCategoriesRoute.name,
         args: ForcedLandingsSubCategoriesRouteArgs(
           key: key,
           nameCategory: nameCategory,
         ),
         rawPathParams: {'nameCategory': nameCategory},
         initialChildren: children,
       );

  static const String name = 'ForcedLandingsSubCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ForcedLandingsSubCategoriesRouteArgs>(
        orElse:
            () => ForcedLandingsSubCategoriesRouteArgs(
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return ForcedLandingsSubCategoriesScreen(
        key: args.key,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class ForcedLandingsSubCategoriesRouteArgs {
  const ForcedLandingsSubCategoriesRouteArgs({
    this.key,
    required this.nameCategory,
  });

  final Key? key;

  final String nameCategory;

  @override
  String toString() {
    return 'ForcedLandingsSubCategoriesRouteArgs{key: $key, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [HandBookMainCategoriesScreen]
class HandBookMainCategoriesRoute extends PageRouteInfo<void> {
  const HandBookMainCategoriesRoute({List<PageRouteInfo>? children})
    : super(HandBookMainCategoriesRoute.name, initialChildren: children);

  static const String name = 'HandBookMainCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HandBookMainCategoriesScreen();
    },
  );
}

/// generated route for
/// [HighCarbonMonoxideCoLevelAdvisoryScreen]
class HighCarbonMonoxideCoLevelAdvisoryRoute extends PageRouteInfo<void> {
  const HighCarbonMonoxideCoLevelAdvisoryRoute({List<PageRouteInfo>? children})
    : super(
        HighCarbonMonoxideCoLevelAdvisoryRoute.name,
        initialChildren: children,
      );

  static const String name = 'HighCarbonMonoxideCoLevelAdvisoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HighCarbonMonoxideCoLevelAdvisoryScreen();
    },
  );
}

/// generated route for
/// [IcingScreen]
class IcingRoute extends PageRouteInfo<void> {
  const IcingRoute({List<PageRouteInfo>? children})
    : super(IcingRoute.name, initialChildren: children);

  static const String name = 'IcingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IcingScreen();
    },
  );
}

/// generated route for
/// [LearningNavigationScreen]
class LearningNavigationRoute extends PageRouteInfo<void> {
  const LearningNavigationRoute({List<PageRouteInfo>? children})
    : super(LearningNavigationRoute.name, initialChildren: children);

  static const String name = 'LearningNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LearningNavigationScreen();
    },
  );
}

/// generated route for
/// [LearningScreen]
class LearningRoute extends PageRouteInfo<void> {
  const LearningRoute({List<PageRouteInfo>? children})
    : super(LearningRoute.name, initialChildren: children);

  static const String name = 'LearningRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LearningScreen();
    },
  );
}

/// generated route for
/// [LowVoltsAnnunciatorComesOnBellow1000RpmScreen]
class LowVoltsAnnunciatorComesOnBellow1000RpmRoute extends PageRouteInfo<void> {
  const LowVoltsAnnunciatorComesOnBellow1000RpmRoute({
    List<PageRouteInfo>? children,
  }) : super(
         LowVoltsAnnunciatorComesOnBellow1000RpmRoute.name,
         initialChildren: children,
       );

  static const String name = 'LowVoltsAnnunciatorComesOnBellow1000RpmRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LowVoltsAnnunciatorComesOnBellow1000RpmScreen();
    },
  );
}

/// generated route for
/// [LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmScreen]
class LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmRoute
    extends PageRouteInfo<void> {
  const LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmRoute({
    List<PageRouteInfo>? children,
  }) : super(
         LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmRoute.name,
         initialChildren: children,
       );

  static const String name =
      'LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmScreen();
    },
  );
}

/// generated route for
/// [MainNavigationScreen]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
    : super(MainNavigationRoute.name, initialChildren: children);

  static const String name = 'MainNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainNavigationScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [MarketNavigationScreen]
class MarketNavigationRoute extends PageRouteInfo<void> {
  const MarketNavigationRoute({List<PageRouteInfo>? children})
    : super(MarketNavigationRoute.name, initialChildren: children);

  static const String name = 'MarketNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MarketNavigationScreen();
    },
  );
}

/// generated route for
/// [MarketScreen]
class MarketRoute extends PageRouteInfo<void> {
  const MarketRoute({List<PageRouteInfo>? children})
    : super(MarketRoute.name, initialChildren: children);

  static const String name = 'MarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MarketScreen();
    },
  );
}

/// generated route for
/// [NewsNavigationScreen]
class NewsNavigationRoute extends PageRouteInfo<void> {
  const NewsNavigationRoute({List<PageRouteInfo>? children})
    : super(NewsNavigationRoute.name, initialChildren: children);

  static const String name = 'NewsNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewsNavigationScreen();
    },
  );
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
    : super(NewsRoute.name, initialChildren: children);

  static const String name = 'NewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewsScreen();
    },
  );
}

/// generated route for
/// [NormalCategoriesScreen]
class NormalCategoriesRoute extends PageRouteInfo<NormalCategoriesRouteArgs> {
  NormalCategoriesRoute({
    Key? key,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         NormalCategoriesRoute.name,
         args: NormalCategoriesRouteArgs(key: key, nameCategory: nameCategory),
         rawPathParams: {'nameCategory': nameCategory},
         initialChildren: children,
       );

  static const String name = 'NormalCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<NormalCategoriesRouteArgs>(
        orElse:
            () => NormalCategoriesRouteArgs(
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return NormalCategoriesScreen(
        key: args.key,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class NormalCategoriesRouteArgs {
  const NormalCategoriesRouteArgs({this.key, required this.nameCategory});

  final Key? key;

  final String nameCategory;

  @override
  String toString() {
    return 'NormalCategoriesRouteArgs{key: $key, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [NormalCheckListScreen]
class NormalCheckListRoute extends PageRouteInfo<NormalCheckListRouteArgs> {
  NormalCheckListRoute({
    Key? key,
    required String normalCategoryId,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         NormalCheckListRoute.name,
         args: NormalCheckListRouteArgs(
           key: key,
           normalCategoryId: normalCategoryId,
           nameCategory: nameCategory,
         ),
         rawPathParams: {
           'normalCategoryId': normalCategoryId,
           'nameCategory': nameCategory,
         },
         initialChildren: children,
       );

  static const String name = 'NormalCheckListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<NormalCheckListRouteArgs>(
        orElse:
            () => NormalCheckListRouteArgs(
              normalCategoryId: pathParams.getString('normalCategoryId'),
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return NormalCheckListScreen(
        key: args.key,
        normalCategoryId: args.normalCategoryId,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class NormalCheckListRouteArgs {
  const NormalCheckListRouteArgs({
    this.key,
    required this.normalCategoryId,
    required this.nameCategory,
  });

  final Key? key;

  final String normalCategoryId;

  final String nameCategory;

  @override
  String toString() {
    return 'NormalCheckListRouteArgs{key: $key, normalCategoryId: $normalCategoryId, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [PreflightInspectionCategoriesScreen]
class PreflightInspectionCategoriesRoute
    extends PageRouteInfo<PreflightInspectionCategoriesRouteArgs> {
  PreflightInspectionCategoriesRoute({
    Key? key,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         PreflightInspectionCategoriesRoute.name,
         args: PreflightInspectionCategoriesRouteArgs(
           key: key,
           nameCategory: nameCategory,
         ),
         rawPathParams: {'nameCategory': nameCategory},
         initialChildren: children,
       );

  static const String name = 'PreflightInspectionCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PreflightInspectionCategoriesRouteArgs>(
        orElse:
            () => PreflightInspectionCategoriesRouteArgs(
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return PreflightInspectionCategoriesScreen(
        key: args.key,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class PreflightInspectionCategoriesRouteArgs {
  const PreflightInspectionCategoriesRouteArgs({
    this.key,
    required this.nameCategory,
  });

  final Key? key;

  final String nameCategory;

  @override
  String toString() {
    return 'PreflightInspectionCategoriesRouteArgs{key: $key, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [PreflightInspectionCheckListScreen]
class PreflightInspectionCheckListRoute
    extends PageRouteInfo<PreflightInspectionCheckListRouteArgs> {
  PreflightInspectionCheckListRoute({
    Key? key,
    required String preflihgtInspectionCategoryId,
    required String nameCategory,
    List<PageRouteInfo>? children,
  }) : super(
         PreflightInspectionCheckListRoute.name,
         args: PreflightInspectionCheckListRouteArgs(
           key: key,
           preflihgtInspectionCategoryId: preflihgtInspectionCategoryId,
           nameCategory: nameCategory,
         ),
         rawPathParams: {
           'preflihgtInspectionCategoryId': preflihgtInspectionCategoryId,
           'nameCategory': nameCategory,
         },
         initialChildren: children,
       );

  static const String name = 'PreflightInspectionCheckListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PreflightInspectionCheckListRouteArgs>(
        orElse:
            () => PreflightInspectionCheckListRouteArgs(
              preflihgtInspectionCategoryId: pathParams.getString(
                'preflihgtInspectionCategoryId',
              ),
              nameCategory: pathParams.getString('nameCategory'),
            ),
      );
      return PreflightInspectionCheckListScreen(
        key: args.key,
        preflihgtInspectionCategoryId: args.preflihgtInspectionCategoryId,
        nameCategory: args.nameCategory,
      );
    },
  );
}

class PreflightInspectionCheckListRouteArgs {
  const PreflightInspectionCheckListRouteArgs({
    this.key,
    required this.preflihgtInspectionCategoryId,
    required this.nameCategory,
  });

  final Key? key;

  final String preflihgtInspectionCategoryId;

  final String nameCategory;

  @override
  String toString() {
    return 'PreflightInspectionCheckListRouteArgs{key: $key, preflihgtInspectionCategoryId: $preflihgtInspectionCategoryId, nameCategory: $nameCategory}';
  }
}

/// generated route for
/// [PricesNavigationScreen]
class PricesNavigationRoute extends PageRouteInfo<void> {
  const PricesNavigationRoute({List<PageRouteInfo>? children})
    : super(PricesNavigationRoute.name, initialChildren: children);

  static const String name = 'PricesNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PricesNavigationScreen();
    },
  );
}

/// generated route for
/// [PricesScreen]
class PricesRoute extends PageRouteInfo<void> {
  const PricesRoute({List<PageRouteInfo>? children})
    : super(PricesRoute.name, initialChildren: children);

  static const String name = 'PricesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PricesScreen();
    },
  );
}

/// generated route for
/// [ProfileNavigationScreen]
class ProfileNavigationRoute extends PageRouteInfo<void> {
  const ProfileNavigationRoute({List<PageRouteInfo>? children})
    : super(ProfileNavigationRoute.name, initialChildren: children);

  static const String name = 'ProfileNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileNavigationScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [SaleRequestNavigationScreen]
class SaleRequestNavigationRoute extends PageRouteInfo<void> {
  const SaleRequestNavigationRoute({List<PageRouteInfo>? children})
    : super(SaleRequestNavigationRoute.name, initialChildren: children);

  static const String name = 'SaleRequestNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SaleRequestNavigationScreen();
    },
  );
}

/// generated route for
/// [SaleRequestScreen]
class SaleRequestRoute extends PageRouteInfo<void> {
  const SaleRequestRoute({List<PageRouteInfo>? children})
    : super(SaleRequestRoute.name, initialChildren: children);

  static const String name = 'SaleRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SaleRequestScreen();
    },
  );
}

/// generated route for
/// [StaticSourceBlockageScreen]
class StaticSourceBlockageRoute extends PageRouteInfo<void> {
  const StaticSourceBlockageRoute({List<PageRouteInfo>? children})
    : super(StaticSourceBlockageRoute.name, initialChildren: children);

  static const String name = 'StaticSourceBlockageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StaticSourceBlockageScreen();
    },
  );
}

/// generated route for
/// [VacuumSystemFailureScreen]
class VacuumSystemFailureRoute extends PageRouteInfo<void> {
  const VacuumSystemFailureRoute({List<PageRouteInfo>? children})
    : super(VacuumSystemFailureRoute.name, initialChildren: children);

  static const String name = 'VacuumSystemFailureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VacuumSystemFailureScreen();
    },
  );
}

/// generated route for
/// [VideoForStudentsScreen]
class VideoForStudentsRoute extends PageRouteInfo<void> {
  const VideoForStudentsRoute({List<PageRouteInfo>? children})
    : super(VideoForStudentsRoute.name, initialChildren: children);

  static const String name = 'VideoForStudentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VideoForStudentsScreen();
    },
  );
}

/// generated route for
/// [WingFireScreen]
class WingFireRoute extends PageRouteInfo<void> {
  const WingFireRoute({List<PageRouteInfo>? children})
    : super(WingFireRoute.name, initialChildren: children);

  static const String name = 'WingFireRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WingFireScreen();
    },
  );
}
