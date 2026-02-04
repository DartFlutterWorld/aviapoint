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
/// [AircraftMarketDetailScreen]
class AircraftMarketDetailRoute
    extends PageRouteInfo<AircraftMarketDetailRouteArgs> {
  AircraftMarketDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
         AircraftMarketDetailRoute.name,
         args: AircraftMarketDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'AircraftMarketDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AircraftMarketDetailRouteArgs>(
        orElse: () =>
            AircraftMarketDetailRouteArgs(id: pathParams.getInt('id')),
      );
      return AircraftMarketDetailScreen(key: args.key, id: args.id);
    },
  );
}

class AircraftMarketDetailRouteArgs {
  const AircraftMarketDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'AircraftMarketDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AircraftMarketDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
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
/// [BaseQuestionsScreen]
class BaseQuestionsRoute extends PageRouteInfo<void> {
  const BaseQuestionsRoute({List<PageRouteInfo>? children})
    : super(BaseQuestionsRoute.name, initialChildren: children);

  static const String name = 'BaseQuestionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseQuestionsScreen();
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
/// [BlogArticleDetailScreen]
class BlogArticleDetailRoute extends PageRouteInfo<BlogArticleDetailRouteArgs> {
  BlogArticleDetailRoute({
    Key? key,
    required int articleId,
    List<PageRouteInfo>? children,
  }) : super(
         BlogArticleDetailRoute.name,
         args: BlogArticleDetailRouteArgs(key: key, articleId: articleId),
         rawPathParams: {'id': articleId},
         initialChildren: children,
       );

  static const String name = 'BlogArticleDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BlogArticleDetailRouteArgs>(
        orElse: () =>
            BlogArticleDetailRouteArgs(articleId: pathParams.getInt('id')),
      );
      return BlogArticleDetailScreen(key: args.key, articleId: args.articleId);
    },
  );
}

class BlogArticleDetailRouteArgs {
  const BlogArticleDetailRouteArgs({this.key, required this.articleId});

  final Key? key;

  final int articleId;

  @override
  String toString() {
    return 'BlogArticleDetailRouteArgs{key: $key, articleId: $articleId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BlogArticleDetailRouteArgs) return false;
    return key == other.key && articleId == other.articleId;
  }

  @override
  int get hashCode => key.hashCode ^ articleId.hashCode;
}

/// generated route for
/// [BlogNavigationScreen]
class BlogNavigationRoute extends PageRouteInfo<void> {
  const BlogNavigationRoute({List<PageRouteInfo>? children})
    : super(BlogNavigationRoute.name, initialChildren: children);

  static const String name = 'BlogNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BlogNavigationScreen();
    },
  );
}

/// generated route for
/// [BlogScreen]
class BlogRoute extends PageRouteInfo<void> {
  const BlogRoute({List<PageRouteInfo>? children})
    : super(BlogRoute.name, initialChildren: children);

  static const String name = 'BlogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BlogScreen();
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
/// [CreateAircraftMarketScreen]
class CreateAircraftMarketRoute extends PageRouteInfo<void> {
  const CreateAircraftMarketRoute({List<PageRouteInfo>? children})
    : super(CreateAircraftMarketRoute.name, initialChildren: children);

  static const String name = 'CreateAircraftMarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateAircraftMarketScreen();
    },
  );
}

/// generated route for
/// [CreateBlogArticleScreen]
class CreateBlogArticleRoute extends PageRouteInfo<void> {
  const CreateBlogArticleRoute({List<PageRouteInfo>? children})
    : super(CreateBlogArticleRoute.name, initialChildren: children);

  static const String name = 'CreateBlogArticleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateBlogArticleScreen();
    },
  );
}

/// generated route for
/// [CreateFlightScreen]
class CreateFlightRoute extends PageRouteInfo<void> {
  const CreateFlightRoute({List<PageRouteInfo>? children})
    : super(CreateFlightRoute.name, initialChildren: children);

  static const String name = 'CreateFlightRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateFlightScreen();
    },
  );
}

/// generated route for
/// [CreateNewsScreen]
class CreateNewsRoute extends PageRouteInfo<void> {
  const CreateNewsRoute({List<PageRouteInfo>? children})
    : super(CreateNewsRoute.name, initialChildren: children);

  static const String name = 'CreateNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateNewsScreen();
    },
  );
}

/// generated route for
/// [CreatePartsMarketScreen]
class CreatePartsMarketRoute extends PageRouteInfo<void> {
  const CreatePartsMarketRoute({List<PageRouteInfo>? children})
    : super(CreatePartsMarketRoute.name, initialChildren: children);

  static const String name = 'CreatePartsMarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreatePartsMarketScreen();
    },
  );
}

/// generated route for
/// [DetailNewsScreen]
class DetailNewsRoute extends PageRouteInfo<DetailNewsRouteArgs> {
  DetailNewsRoute({
    Key? key,
    required int newsId,
    required NewsEntity news,
    List<PageRouteInfo>? children,
  }) : super(
         DetailNewsRoute.name,
         args: DetailNewsRouteArgs(key: key, newsId: newsId, news: news),
         rawPathParams: {'id': newsId},
         initialChildren: children,
       );

  static const String name = 'DetailNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailNewsRouteArgs>();
      return DetailNewsScreen(
        key: args.key,
        newsId: args.newsId,
        news: args.news,
      );
    },
  );
}

class DetailNewsRouteArgs {
  const DetailNewsRouteArgs({
    this.key,
    required this.newsId,
    required this.news,
  });

  final Key? key;

  final int newsId;

  final NewsEntity news;

  @override
  String toString() {
    return 'DetailNewsRouteArgs{key: $key, newsId: $newsId, news: $news}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailNewsRouteArgs) return false;
    return key == other.key && newsId == other.newsId && news == other.news;
  }

  @override
  int get hashCode => key.hashCode ^ newsId.hashCode ^ news.hashCode;
}

/// generated route for
/// [DetailQuestionScreen]
class DetailQuestionRoute extends PageRouteInfo<DetailQuestionRouteArgs> {
  DetailQuestionRoute({
    Key? key,
    QuestionWithAnswersEntity? question,
    bool withClose = false,
    String? categoryTitle,
    required int questionId,
    List<PageRouteInfo>? children,
  }) : super(
         DetailQuestionRoute.name,
         args: DetailQuestionRouteArgs(
           key: key,
           question: question,
           withClose: withClose,
           categoryTitle: categoryTitle,
           questionId: questionId,
         ),
         rawPathParams: {'questionId': questionId},
         rawQueryParams: {
           'question': question,
           'withClose': withClose,
           'categoryTitle': categoryTitle,
         },
         initialChildren: children,
       );

  static const String name = 'DetailQuestionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<DetailQuestionRouteArgs>(
        orElse: () => DetailQuestionRouteArgs(
          question: queryParams.get('question'),
          withClose: queryParams.getBool('withClose', false),
          categoryTitle: queryParams.optString('categoryTitle'),
          questionId: pathParams.getInt('questionId'),
        ),
      );
      return DetailQuestionScreen(
        key: args.key,
        question: args.question,
        withClose: args.withClose,
        categoryTitle: args.categoryTitle,
        questionId: args.questionId,
      );
    },
  );
}

class DetailQuestionRouteArgs {
  const DetailQuestionRouteArgs({
    this.key,
    this.question,
    this.withClose = false,
    this.categoryTitle,
    required this.questionId,
  });

  final Key? key;

  final QuestionWithAnswersEntity? question;

  final bool withClose;

  final String? categoryTitle;

  final int questionId;

  @override
  String toString() {
    return 'DetailQuestionRouteArgs{key: $key, question: $question, withClose: $withClose, categoryTitle: $categoryTitle, questionId: $questionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailQuestionRouteArgs) return false;
    return key == other.key &&
        question == other.question &&
        withClose == other.withClose &&
        categoryTitle == other.categoryTitle &&
        questionId == other.questionId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      question.hashCode ^
      withClose.hashCode ^
      categoryTitle.hashCode ^
      questionId.hashCode;
}

/// generated route for
/// [DetailStoryScreen]
class DetailStoryRoute extends PageRouteInfo<DetailStoryRouteArgs> {
  DetailStoryRoute({
    Key? key,
    required int idStory,
    required List<StoryEntity> stories,
    required int currentIndex,
    List<PageRouteInfo>? children,
  }) : super(
         DetailStoryRoute.name,
         args: DetailStoryRouteArgs(
           key: key,
           idStory: idStory,
           stories: stories,
           currentIndex: currentIndex,
         ),
         rawPathParams: {'id': idStory},
         initialChildren: children,
       );

  static const String name = 'DetailStoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailStoryRouteArgs>();
      return DetailStoryScreen(
        key: args.key,
        idStory: args.idStory,
        stories: args.stories,
        currentIndex: args.currentIndex,
      );
    },
  );
}

class DetailStoryRouteArgs {
  const DetailStoryRouteArgs({
    this.key,
    required this.idStory,
    required this.stories,
    required this.currentIndex,
  });

  final Key? key;

  final int idStory;

  final List<StoryEntity> stories;

  final int currentIndex;

  @override
  String toString() {
    return 'DetailStoryRouteArgs{key: $key, idStory: $idStory, stories: $stories, currentIndex: $currentIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailStoryRouteArgs) return false;
    return key == other.key &&
        idStory == other.idStory &&
        const ListEquality<StoryEntity>().equals(stories, other.stories) &&
        currentIndex == other.currentIndex;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      idStory.hashCode ^
      const ListEquality<StoryEntity>().hash(stories) ^
      currentIndex.hashCode;
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
/// [EditAircraftMarketScreen]
class EditAircraftMarketRoute
    extends PageRouteInfo<EditAircraftMarketRouteArgs> {
  EditAircraftMarketRoute({
    Key? key,
    required int productId,
    List<PageRouteInfo>? children,
  }) : super(
         EditAircraftMarketRoute.name,
         args: EditAircraftMarketRouteArgs(key: key, productId: productId),
         rawPathParams: {'id': productId},
         initialChildren: children,
       );

  static const String name = 'EditAircraftMarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditAircraftMarketRouteArgs>(
        orElse: () =>
            EditAircraftMarketRouteArgs(productId: pathParams.getInt('id')),
      );
      return EditAircraftMarketScreen(key: args.key, productId: args.productId);
    },
  );
}

class EditAircraftMarketRouteArgs {
  const EditAircraftMarketRouteArgs({this.key, required this.productId});

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'EditAircraftMarketRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditAircraftMarketRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [EditAirportScreen]
class EditAirportRoute extends PageRouteInfo<EditAirportRouteArgs> {
  EditAirportRoute({
    Key? key,
    required String airportCode,
    List<PageRouteInfo>? children,
  }) : super(
         EditAirportRoute.name,
         args: EditAirportRouteArgs(key: key, airportCode: airportCode),
         initialChildren: children,
       );

  static const String name = 'EditAirportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditAirportRouteArgs>();
      return EditAirportScreen(key: args.key, airportCode: args.airportCode);
    },
  );
}

class EditAirportRouteArgs {
  const EditAirportRouteArgs({this.key, required this.airportCode});

  final Key? key;

  final String airportCode;

  @override
  String toString() {
    return 'EditAirportRouteArgs{key: $key, airportCode: $airportCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditAirportRouteArgs) return false;
    return key == other.key && airportCode == other.airportCode;
  }

  @override
  int get hashCode => key.hashCode ^ airportCode.hashCode;
}

/// generated route for
/// [EditBlogArticleScreen]
class EditBlogArticleRoute extends PageRouteInfo<EditBlogArticleRouteArgs> {
  EditBlogArticleRoute({
    Key? key,
    required int articleId,
    List<PageRouteInfo>? children,
  }) : super(
         EditBlogArticleRoute.name,
         args: EditBlogArticleRouteArgs(key: key, articleId: articleId),
         rawPathParams: {'id': articleId},
         initialChildren: children,
       );

  static const String name = 'EditBlogArticleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditBlogArticleRouteArgs>(
        orElse: () =>
            EditBlogArticleRouteArgs(articleId: pathParams.getInt('id')),
      );
      return EditBlogArticleScreen(key: args.key, articleId: args.articleId);
    },
  );
}

class EditBlogArticleRouteArgs {
  const EditBlogArticleRouteArgs({this.key, required this.articleId});

  final Key? key;

  final int articleId;

  @override
  String toString() {
    return 'EditBlogArticleRouteArgs{key: $key, articleId: $articleId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditBlogArticleRouteArgs) return false;
    return key == other.key && articleId == other.articleId;
  }

  @override
  int get hashCode => key.hashCode ^ articleId.hashCode;
}

/// generated route for
/// [EditFlightScreen]
class EditFlightRoute extends PageRouteInfo<EditFlightRouteArgs> {
  EditFlightRoute({
    Key? key,
    required FlightEntity flight,
    List<PageRouteInfo>? children,
  }) : super(
         EditFlightRoute.name,
         args: EditFlightRouteArgs(key: key, flight: flight),
         initialChildren: children,
       );

  static const String name = 'EditFlightRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditFlightRouteArgs>();
      return EditFlightScreen(key: args.key, flight: args.flight);
    },
  );
}

class EditFlightRouteArgs {
  const EditFlightRouteArgs({this.key, required this.flight});

  final Key? key;

  final FlightEntity flight;

  @override
  String toString() {
    return 'EditFlightRouteArgs{key: $key, flight: $flight}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditFlightRouteArgs) return false;
    return key == other.key && flight == other.flight;
  }

  @override
  int get hashCode => key.hashCode ^ flight.hashCode;
}

/// generated route for
/// [EditNewsScreen]
class EditNewsRoute extends PageRouteInfo<EditNewsRouteArgs> {
  EditNewsRoute({Key? key, required int newsId, List<PageRouteInfo>? children})
    : super(
        EditNewsRoute.name,
        args: EditNewsRouteArgs(key: key, newsId: newsId),
        rawPathParams: {'id': newsId},
        initialChildren: children,
      );

  static const String name = 'EditNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditNewsRouteArgs>(
        orElse: () => EditNewsRouteArgs(newsId: pathParams.getInt('id')),
      );
      return EditNewsScreen(key: args.key, newsId: args.newsId);
    },
  );
}

class EditNewsRouteArgs {
  const EditNewsRouteArgs({this.key, required this.newsId});

  final Key? key;

  final int newsId;

  @override
  String toString() {
    return 'EditNewsRouteArgs{key: $key, newsId: $newsId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditNewsRouteArgs) return false;
    return key == other.key && newsId == other.newsId;
  }

  @override
  int get hashCode => key.hashCode ^ newsId.hashCode;
}

/// generated route for
/// [EditPartsMarketScreen]
class EditPartsMarketRoute extends PageRouteInfo<EditPartsMarketRouteArgs> {
  EditPartsMarketRoute({
    Key? key,
    required int productId,
    List<PageRouteInfo>? children,
  }) : super(
         EditPartsMarketRoute.name,
         args: EditPartsMarketRouteArgs(key: key, productId: productId),
         rawPathParams: {'id': productId},
         initialChildren: children,
       );

  static const String name = 'EditPartsMarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EditPartsMarketRouteArgs>(
        orElse: () =>
            EditPartsMarketRouteArgs(productId: pathParams.getInt('id')),
      );
      return EditPartsMarketScreen(key: args.key, productId: args.productId);
    },
  );
}

class EditPartsMarketRouteArgs {
  const EditPartsMarketRouteArgs({this.key, required this.productId});

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'EditPartsMarketRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditPartsMarketRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
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
         initialChildren: children,
       );

  static const String name = 'ElectricalPowerSubCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ElectricalPowerSubCategoryRouteArgs>();
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ElectricalPowerSubCategoryRouteArgs) return false;
    return key == other.key && nameCategory == other.nameCategory;
  }

  @override
  int get hashCode => key.hashCode ^ nameCategory.hashCode;
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
class EmergencyCategoriesRoute extends PageRouteInfo<void> {
  const EmergencyCategoriesRoute({List<PageRouteInfo>? children})
    : super(EmergencyCategoriesRoute.name, initialChildren: children);

  static const String name = 'EmergencyCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmergencyCategoriesScreen();
    },
  );
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
         initialChildren: children,
       );

  static const String name = 'FiresSubCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FiresSubCategoriesRouteArgs>();
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FiresSubCategoriesRouteArgs) return false;
    return key == other.key && nameCategory == other.nameCategory;
  }

  @override
  int get hashCode => key.hashCode ^ nameCategory.hashCode;
}

/// generated route for
/// [FlightDetailScreen]
class FlightDetailRoute extends PageRouteInfo<FlightDetailRouteArgs> {
  FlightDetailRoute({
    Key? key,
    required int flightId,
    List<PageRouteInfo>? children,
  }) : super(
         FlightDetailRoute.name,
         args: FlightDetailRouteArgs(key: key, flightId: flightId),
         rawPathParams: {'id': flightId},
         initialChildren: children,
       );

  static const String name = 'FlightDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FlightDetailRouteArgs>(
        orElse: () => FlightDetailRouteArgs(flightId: pathParams.getInt('id')),
      );
      return FlightDetailScreen(key: args.key, flightId: args.flightId);
    },
  );
}

class FlightDetailRouteArgs {
  const FlightDetailRouteArgs({this.key, required this.flightId});

  final Key? key;

  final int flightId;

  @override
  String toString() {
    return 'FlightDetailRouteArgs{key: $key, flightId: $flightId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FlightDetailRouteArgs) return false;
    return key == other.key && flightId == other.flightId;
  }

  @override
  int get hashCode => key.hashCode ^ flightId.hashCode;
}

/// generated route for
/// [FlightsListScreen]
class FlightsListRoute extends PageRouteInfo<FlightsListRouteArgs> {
  FlightsListRoute({
    Key? key,
    int? initialTabIndex,
    List<PageRouteInfo>? children,
  }) : super(
         FlightsListRoute.name,
         args: FlightsListRouteArgs(key: key, initialTabIndex: initialTabIndex),
         initialChildren: children,
       );

  static const String name = 'FlightsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlightsListRouteArgs>(
        orElse: () => const FlightsListRouteArgs(),
      );
      return FlightsListScreen(
        key: args.key,
        initialTabIndex: args.initialTabIndex,
      );
    },
  );
}

class FlightsListRouteArgs {
  const FlightsListRouteArgs({this.key, this.initialTabIndex});

  final Key? key;

  final int? initialTabIndex;

  @override
  String toString() {
    return 'FlightsListRouteArgs{key: $key, initialTabIndex: $initialTabIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FlightsListRouteArgs) return false;
    return key == other.key && initialTabIndex == other.initialTabIndex;
  }

  @override
  int get hashCode => key.hashCode ^ initialTabIndex.hashCode;
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
         initialChildren: children,
       );

  static const String name = 'ForcedLandingsSubCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForcedLandingsSubCategoriesRouteArgs>();
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForcedLandingsSubCategoriesRouteArgs) return false;
    return key == other.key && nameCategory == other.nameCategory;
  }

  @override
  int get hashCode => key.hashCode ^ nameCategory.hashCode;
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
/// [ListQuestionByCategoryScreen]
class ListQuestionByCategoryRoute
    extends PageRouteInfo<ListQuestionByCategoryRouteArgs> {
  ListQuestionByCategoryRoute({
    Key? key,
    required int categoryId,
    List<QuestionWithAnswersEntity>? questionWithAnswersList,
    String? categoryTitle,
    List<PageRouteInfo>? children,
  }) : super(
         ListQuestionByCategoryRoute.name,
         args: ListQuestionByCategoryRouteArgs(
           key: key,
           categoryId: categoryId,
           questionWithAnswersList: questionWithAnswersList,
           categoryTitle: categoryTitle,
         ),
         rawPathParams: {'categoryId': categoryId},
         rawQueryParams: {'categoryTitle': categoryTitle},
         initialChildren: children,
       );

  static const String name = 'ListQuestionByCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<ListQuestionByCategoryRouteArgs>(
        orElse: () => ListQuestionByCategoryRouteArgs(
          categoryId: pathParams.getInt('categoryId'),
          categoryTitle: queryParams.optString('categoryTitle'),
        ),
      );
      return ListQuestionByCategoryScreen(
        key: args.key,
        categoryId: args.categoryId,
        questionWithAnswersList: args.questionWithAnswersList,
        categoryTitle: args.categoryTitle,
      );
    },
  );
}

class ListQuestionByCategoryRouteArgs {
  const ListQuestionByCategoryRouteArgs({
    this.key,
    required this.categoryId,
    this.questionWithAnswersList,
    this.categoryTitle,
  });

  final Key? key;

  final int categoryId;

  final List<QuestionWithAnswersEntity>? questionWithAnswersList;

  final String? categoryTitle;

  @override
  String toString() {
    return 'ListQuestionByCategoryRouteArgs{key: $key, categoryId: $categoryId, questionWithAnswersList: $questionWithAnswersList, categoryTitle: $categoryTitle}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ListQuestionByCategoryRouteArgs) return false;
    return key == other.key &&
        categoryId == other.categoryId &&
        const ListEquality<QuestionWithAnswersEntity>().equals(
          questionWithAnswersList,
          other.questionWithAnswersList,
        ) &&
        categoryTitle == other.categoryTitle;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      categoryId.hashCode ^
      const ListEquality<QuestionWithAnswersEntity>().hash(
        questionWithAnswersList,
      ) ^
      categoryTitle.hashCode;
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
class MarketRoute extends PageRouteInfo<MarketRouteArgs> {
  MarketRoute({Key? key, int? initialTab, List<PageRouteInfo>? children})
    : super(
        MarketRoute.name,
        args: MarketRouteArgs(key: key, initialTab: initialTab),
        initialChildren: children,
      );

  static const String name = 'MarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MarketRouteArgs>(
        orElse: () => const MarketRouteArgs(),
      );
      return MarketScreen(key: args.key, initialTab: args.initialTab);
    },
  );
}

class MarketRouteArgs {
  const MarketRouteArgs({this.key, this.initialTab});

  final Key? key;

  final int? initialTab;

  @override
  String toString() {
    return 'MarketRouteArgs{key: $key, initialTab: $initialTab}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MarketRouteArgs) return false;
    return key == other.key && initialTab == other.initialTab;
  }

  @override
  int get hashCode => key.hashCode ^ initialTab.hashCode;
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
class NormalCategoriesRoute extends PageRouteInfo<void> {
  const NormalCategoriesRoute({List<PageRouteInfo>? children})
    : super(NormalCategoriesRoute.name, initialChildren: children);

  static const String name = 'NormalCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NormalCategoriesScreen();
    },
  );
}

/// generated route for
/// [NormalCheckListScreen]
class NormalCheckListRoute extends PageRouteInfo<NormalCheckListRouteArgs> {
  NormalCheckListRoute({
    Key? key,
    required String normalCategoryId,
    List<PageRouteInfo>? children,
  }) : super(
         NormalCheckListRoute.name,
         args: NormalCheckListRouteArgs(
           key: key,
           normalCategoryId: normalCategoryId,
         ),
         rawPathParams: {'normalCategoryId': normalCategoryId},
         initialChildren: children,
       );

  static const String name = 'NormalCheckListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<NormalCheckListRouteArgs>(
        orElse: () => NormalCheckListRouteArgs(
          normalCategoryId: pathParams.getString('normalCategoryId'),
        ),
      );
      return NormalCheckListScreen(
        key: args.key,
        normalCategoryId: args.normalCategoryId,
      );
    },
  );
}

class NormalCheckListRouteArgs {
  const NormalCheckListRouteArgs({this.key, required this.normalCategoryId});

  final Key? key;

  final String normalCategoryId;

  @override
  String toString() {
    return 'NormalCheckListRouteArgs{key: $key, normalCategoryId: $normalCategoryId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NormalCheckListRouteArgs) return false;
    return key == other.key && normalCategoryId == other.normalCategoryId;
  }

  @override
  int get hashCode => key.hashCode ^ normalCategoryId.hashCode;
}

/// generated route for
/// [OnTheWayNavigationScreen]
class OnTheWayNavigationRoute extends PageRouteInfo<void> {
  const OnTheWayNavigationRoute({List<PageRouteInfo>? children})
    : super(OnTheWayNavigationRoute.name, initialChildren: children);

  static const String name = 'OnTheWayNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnTheWayNavigationScreen();
    },
  );
}

/// generated route for
/// [PartsMarketDetailScreen]
class PartsMarketDetailRoute extends PageRouteInfo<PartsMarketDetailRouteArgs> {
  PartsMarketDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
         PartsMarketDetailRoute.name,
         args: PartsMarketDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'PartsMarketDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PartsMarketDetailRouteArgs>(
        orElse: () => PartsMarketDetailRouteArgs(id: pathParams.getInt('id')),
      );
      return PartsMarketDetailScreen(key: args.key, id: args.id);
    },
  );
}

class PartsMarketDetailRouteArgs {
  const PartsMarketDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'PartsMarketDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PartsMarketDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [PaymentScreen]
class PaymentRoute extends PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({
    Key? key,
    required double amount,
    String currency = 'RUB',
    required String description,
    required int subscriptionTypeId,
    String? returnUrl,
    String? returnRouteSource,
    List<PageRouteInfo>? children,
  }) : super(
         PaymentRoute.name,
         args: PaymentRouteArgs(
           key: key,
           amount: amount,
           currency: currency,
           description: description,
           subscriptionTypeId: subscriptionTypeId,
           returnUrl: returnUrl,
           returnRouteSource: returnRouteSource,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentRouteArgs>();
      return PaymentScreen(
        key: args.key,
        amount: args.amount,
        currency: args.currency,
        description: args.description,
        subscriptionTypeId: args.subscriptionTypeId,
        returnUrl: args.returnUrl,
        returnRouteSource: args.returnRouteSource,
      );
    },
  );
}

class PaymentRouteArgs {
  const PaymentRouteArgs({
    this.key,
    required this.amount,
    this.currency = 'RUB',
    required this.description,
    required this.subscriptionTypeId,
    this.returnUrl,
    this.returnRouteSource,
  });

  final Key? key;

  final double amount;

  final String currency;

  final String description;

  final int subscriptionTypeId;

  final String? returnUrl;

  final String? returnRouteSource;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, amount: $amount, currency: $currency, description: $description, subscriptionTypeId: $subscriptionTypeId, returnUrl: $returnUrl, returnRouteSource: $returnRouteSource}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentRouteArgs) return false;
    return key == other.key &&
        amount == other.amount &&
        currency == other.currency &&
        description == other.description &&
        subscriptionTypeId == other.subscriptionTypeId &&
        returnUrl == other.returnUrl &&
        returnRouteSource == other.returnRouteSource;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      amount.hashCode ^
      currency.hashCode ^
      description.hashCode ^
      subscriptionTypeId.hashCode ^
      returnUrl.hashCode ^
      returnRouteSource.hashCode;
}

/// generated route for
/// [PaymentWebViewScreen]
class PaymentWebViewRoute extends PageRouteInfo<PaymentWebViewRouteArgs> {
  PaymentWebViewRoute({
    Key? key,
    required String paymentUrl,
    String? returnRouteSource,
    String? paymentId,
    VoidCallback? onSuccess,
    VoidCallback? onCancel,
    VoidCallback? onFailure,
    List<PageRouteInfo>? children,
  }) : super(
         PaymentWebViewRoute.name,
         args: PaymentWebViewRouteArgs(
           key: key,
           paymentUrl: paymentUrl,
           returnRouteSource: returnRouteSource,
           paymentId: paymentId,
           onSuccess: onSuccess,
           onCancel: onCancel,
           onFailure: onFailure,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentWebViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentWebViewRouteArgs>();
      return PaymentWebViewScreen(
        key: args.key,
        paymentUrl: args.paymentUrl,
        returnRouteSource: args.returnRouteSource,
        paymentId: args.paymentId,
        onSuccess: args.onSuccess,
        onCancel: args.onCancel,
        onFailure: args.onFailure,
      );
    },
  );
}

class PaymentWebViewRouteArgs {
  const PaymentWebViewRouteArgs({
    this.key,
    required this.paymentUrl,
    this.returnRouteSource,
    this.paymentId,
    this.onSuccess,
    this.onCancel,
    this.onFailure,
  });

  final Key? key;

  final String paymentUrl;

  final String? returnRouteSource;

  final String? paymentId;

  final VoidCallback? onSuccess;

  final VoidCallback? onCancel;

  final VoidCallback? onFailure;

  @override
  String toString() {
    return 'PaymentWebViewRouteArgs{key: $key, paymentUrl: $paymentUrl, returnRouteSource: $returnRouteSource, paymentId: $paymentId, onSuccess: $onSuccess, onCancel: $onCancel, onFailure: $onFailure}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentWebViewRouteArgs) return false;
    return key == other.key &&
        paymentUrl == other.paymentUrl &&
        returnRouteSource == other.returnRouteSource &&
        paymentId == other.paymentId &&
        onSuccess == other.onSuccess &&
        onCancel == other.onCancel &&
        onFailure == other.onFailure;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      paymentUrl.hashCode ^
      returnRouteSource.hashCode ^
      paymentId.hashCode ^
      onSuccess.hashCode ^
      onCancel.hashCode ^
      onFailure.hashCode;
}

/// generated route for
/// [PreflightInspectionCategoriesScreen]
class PreflightInspectionCategoriesRoute extends PageRouteInfo<void> {
  const PreflightInspectionCategoriesRoute({List<PageRouteInfo>? children})
    : super(PreflightInspectionCategoriesRoute.name, initialChildren: children);

  static const String name = 'PreflightInspectionCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PreflightInspectionCategoriesScreen();
    },
  );
}

/// generated route for
/// [PreflightInspectionCheckListScreen]
class PreflightInspectionCheckListRoute
    extends PageRouteInfo<PreflightInspectionCheckListRouteArgs> {
  PreflightInspectionCheckListRoute({
    Key? key,
    required String preflihgtInspectionCategoryId,
    List<PageRouteInfo>? children,
  }) : super(
         PreflightInspectionCheckListRoute.name,
         args: PreflightInspectionCheckListRouteArgs(
           key: key,
           preflihgtInspectionCategoryId: preflihgtInspectionCategoryId,
         ),
         rawPathParams: {
           'preflihgtInspectionCategoryId': preflihgtInspectionCategoryId,
         },
         initialChildren: children,
       );

  static const String name = 'PreflightInspectionCheckListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PreflightInspectionCheckListRouteArgs>(
        orElse: () => PreflightInspectionCheckListRouteArgs(
          preflihgtInspectionCategoryId: pathParams.getString(
            'preflihgtInspectionCategoryId',
          ),
        ),
      );
      return PreflightInspectionCheckListScreen(
        key: args.key,
        preflihgtInspectionCategoryId: args.preflihgtInspectionCategoryId,
      );
    },
  );
}

class PreflightInspectionCheckListRouteArgs {
  const PreflightInspectionCheckListRouteArgs({
    this.key,
    required this.preflihgtInspectionCategoryId,
  });

  final Key? key;

  final String preflihgtInspectionCategoryId;

  @override
  String toString() {
    return 'PreflightInspectionCheckListRouteArgs{key: $key, preflihgtInspectionCategoryId: $preflihgtInspectionCategoryId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreflightInspectionCheckListRouteArgs) return false;
    return key == other.key &&
        preflihgtInspectionCategoryId == other.preflihgtInspectionCategoryId;
  }

  @override
  int get hashCode => key.hashCode ^ preflihgtInspectionCategoryId.hashCode;
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
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyScreen();
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
/// [TestByModeScreen]
class TestByModeRoute extends PageRouteInfo<TestByModeRouteArgs> {
  TestByModeRoute({
    Key? key,
    required int typeCertificateId,
    List<PageRouteInfo>? children,
  }) : super(
         TestByModeRoute.name,
         args: TestByModeRouteArgs(
           key: key,
           typeCertificateId: typeCertificateId,
         ),
         rawPathParams: {'typeCertificateId': typeCertificateId},
         initialChildren: children,
       );

  static const String name = 'TestByModeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TestByModeRouteArgs>(
        orElse: () => TestByModeRouteArgs(
          typeCertificateId: pathParams.getInt('typeCertificateId'),
        ),
      );
      return TestByModeScreen(
        key: args.key,
        typeCertificateId: args.typeCertificateId,
      );
    },
  );
}

class TestByModeRouteArgs {
  const TestByModeRouteArgs({this.key, required this.typeCertificateId});

  final Key? key;

  final int typeCertificateId;

  @override
  String toString() {
    return 'TestByModeRouteArgs{key: $key, typeCertificateId: $typeCertificateId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestByModeRouteArgs) return false;
    return key == other.key && typeCertificateId == other.typeCertificateId;
  }

  @override
  int get hashCode => key.hashCode ^ typeCertificateId.hashCode;
}

/// generated route for
/// [TestResultsScreen]
class TestResultsRoute extends PageRouteInfo<TestResultsRouteArgs> {
  TestResultsRoute({
    required int certificateTypeId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TestResultsRoute.name,
         args: TestResultsRouteArgs(
           certificateTypeId: certificateTypeId,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'TestResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestResultsRouteArgs>();
      return TestResultsScreen(
        certificateTypeId: args.certificateTypeId,
        key: args.key,
      );
    },
  );
}

class TestResultsRouteArgs {
  const TestResultsRouteArgs({required this.certificateTypeId, this.key});

  final int certificateTypeId;

  final Key? key;

  @override
  String toString() {
    return 'TestResultsRouteArgs{certificateTypeId: $certificateTypeId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestResultsRouteArgs) return false;
    return certificateTypeId == other.certificateTypeId && key == other.key;
  }

  @override
  int get hashCode => certificateTypeId.hashCode ^ key.hashCode;
}

/// generated route for
/// [TestingModeScreen]
class TestingModeRoute extends PageRouteInfo<void> {
  const TestingModeRoute({List<PageRouteInfo>? children})
    : super(TestingModeRoute.name, initialChildren: children);

  static const String name = 'TestingModeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestingModeScreen();
    },
  );
}

/// generated route for
/// [UserNewsScreen]
class UserNewsRoute extends PageRouteInfo<void> {
  const UserNewsRoute({List<PageRouteInfo>? children})
    : super(UserNewsRoute.name, initialChildren: children);

  static const String name = 'UserNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserNewsScreen();
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
