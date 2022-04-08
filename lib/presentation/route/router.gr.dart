// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    QuestionVoiceRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const QuestionVoicePage());
    },
    ScoreRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ScorePage());
    },
    SelectionRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SelectionPage());
    },
    ChangePasswordRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ChangePasswordPage());
    },
    WaitingRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const WaitingPage());
    },
    QuizRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const QuizPage());
    },
    HistoryRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HistoryPage());
    },
    PersonalStudyTopicRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PersonalStudyTopicPage());
    },
    PersonalTopicRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PersonalTopicPage());
    },
    UserInfoRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const UserInfoPage());
    },
    ListVocabularyRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ListVocabularyPage());
    },
    ListStudyVocabularyRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ListStudyVocabularyPage());
    },
    IntroduceRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const IntroducePage());
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    NewsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const NewsPage());
    },
    DiscoverRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const DiscoverPage());
    },
    TopicRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const TopicPage());
    },
    PracticeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PracticePage());
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ProfilePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(RegisterRoute.name, path: '/register'),
        RouteConfig(QuestionVoiceRoute.name, path: '/selection/organism'),
        RouteConfig(ScoreRoute.name, path: '/score'),
        RouteConfig(SelectionRoute.name, path: '/selection'),
        RouteConfig(ChangePasswordRoute.name, path: '/change_password'),
        RouteConfig(WaitingRoute.name, path: '/waiting'),
        RouteConfig(QuizRoute.name, path: '/quiz'),
        RouteConfig(HistoryRoute.name, path: '/history'),
        RouteConfig(PersonalStudyTopicRoute.name,
            path: '/personal_study_topics'),
        RouteConfig(PersonalTopicRoute.name, path: '/personal_topics'),
        RouteConfig(UserInfoRoute.name, path: '/user_info'),
        RouteConfig(ListVocabularyRoute.name, path: '/list_vocabulary'),
        RouteConfig(ListStudyVocabularyRoute.name,
            path: '/list_study_vocabulary'),
        RouteConfig(IntroduceRoute.name, path: '/introduce'),
        RouteConfig(HomeRoute.name, path: '/home', children: [
          RouteConfig(NewsRoute.name, path: 'news', parent: HomeRoute.name),
          RouteConfig(DiscoverRoute.name,
              path: 'discover', parent: HomeRoute.name),
          RouteConfig(TopicRoute.name, path: 'topic', parent: HomeRoute.name),
          RouteConfig(PracticeRoute.name,
              path: 'practice', parent: HomeRoute.name),
          RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [QuestionVoicePage]
class QuestionVoiceRoute extends PageRouteInfo<void> {
  const QuestionVoiceRoute()
      : super(QuestionVoiceRoute.name, path: '/selection/organism');

  static const String name = 'QuestionVoiceRoute';
}

/// generated route for
/// [ScorePage]
class ScoreRoute extends PageRouteInfo<void> {
  const ScoreRoute() : super(ScoreRoute.name, path: '/score');

  static const String name = 'ScoreRoute';
}

/// generated route for
/// [SelectionPage]
class SelectionRoute extends PageRouteInfo<void> {
  const SelectionRoute() : super(SelectionRoute.name, path: '/selection');

  static const String name = 'SelectionRoute';
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change_password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [WaitingPage]
class WaitingRoute extends PageRouteInfo<void> {
  const WaitingRoute() : super(WaitingRoute.name, path: '/waiting');

  static const String name = 'WaitingRoute';
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute() : super(QuizRoute.name, path: '/quiz');

  static const String name = 'QuizRoute';
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute() : super(HistoryRoute.name, path: '/history');

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [PersonalStudyTopicPage]
class PersonalStudyTopicRoute extends PageRouteInfo<void> {
  const PersonalStudyTopicRoute()
      : super(PersonalStudyTopicRoute.name, path: '/personal_study_topics');

  static const String name = 'PersonalStudyTopicRoute';
}

/// generated route for
/// [PersonalTopicPage]
class PersonalTopicRoute extends PageRouteInfo<void> {
  const PersonalTopicRoute()
      : super(PersonalTopicRoute.name, path: '/personal_topics');

  static const String name = 'PersonalTopicRoute';
}

/// generated route for
/// [UserInfoPage]
class UserInfoRoute extends PageRouteInfo<void> {
  const UserInfoRoute() : super(UserInfoRoute.name, path: '/user_info');

  static const String name = 'UserInfoRoute';
}

/// generated route for
/// [ListVocabularyPage]
class ListVocabularyRoute extends PageRouteInfo<void> {
  const ListVocabularyRoute()
      : super(ListVocabularyRoute.name, path: '/list_vocabulary');

  static const String name = 'ListVocabularyRoute';
}

/// generated route for
/// [ListStudyVocabularyPage]
class ListStudyVocabularyRoute extends PageRouteInfo<void> {
  const ListStudyVocabularyRoute()
      : super(ListStudyVocabularyRoute.name, path: '/list_study_vocabulary');

  static const String name = 'ListStudyVocabularyRoute';
}

/// generated route for
/// [IntroducePage]
class IntroduceRoute extends PageRouteInfo<void> {
  const IntroduceRoute() : super(IntroduceRoute.name, path: '/introduce');

  static const String name = 'IntroduceRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [DiscoverPage]
class DiscoverRoute extends PageRouteInfo<void> {
  const DiscoverRoute() : super(DiscoverRoute.name, path: 'discover');

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [TopicPage]
class TopicRoute extends PageRouteInfo<void> {
  const TopicRoute() : super(TopicRoute.name, path: 'topic');

  static const String name = 'TopicRoute';
}

/// generated route for
/// [PracticePage]
class PracticeRoute extends PageRouteInfo<void> {
  const PracticeRoute() : super(PracticeRoute.name, path: 'practice');

  static const String name = 'PracticeRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
