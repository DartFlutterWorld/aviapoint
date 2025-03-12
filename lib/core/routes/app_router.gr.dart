// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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
/// [TradingsNavigationScreen]
class TradingsNavigationRoute extends PageRouteInfo<void> {
  const TradingsNavigationRoute({List<PageRouteInfo>? children})
    : super(TradingsNavigationRoute.name, initialChildren: children);

  static const String name = 'TradingsNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TradingsNavigationScreen();
    },
  );
}

/// generated route for
/// [TradingsScreen]
class TradingsRoute extends PageRouteInfo<void> {
  const TradingsRoute({List<PageRouteInfo>? children})
    : super(TradingsRoute.name, initialChildren: children);

  static const String name = 'TradingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TradingsScreen();
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
