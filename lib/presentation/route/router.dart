library router;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/presentation/views/question/score/score_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../views/discover/discover_page.dart';
import '../views/history/history_page.dart';
import '../views/home/home_page.dart';
import '../views/introduce/introduce_page.dart';
import '../views/list_study_vocabulary/list_study_vocabulary_page.dart';
import '../views/list_vocabulary/list_vocabulary_page.dart';
import '../views/login/login_page.dart';
import '../views/news/news_page.dart';
import '../views/personal_study_topics/personal_study_topics_page.dart';
import '../views/personal_topic/personal_topic_page.dart';
import '../views/practice/practice_page.dart';
import '../views/profile/profile_page.dart';
import '../views/question/quiz/quiz_page.dart';
import '../views/register/register_page.dart';
import '../views/selection/organism/question_voice.dart';
import '../views/selection/selection_page.dart';
import '../views/splash/splash_page.dart';
import '../views/topic/topic_page.dart';
import '../views/user_info/organism/change_password_page.dart';
import '../views/user_info/user_info_page.dart';
import '../views/waiting/waiting_page.dart';


part 'router.gr.dart';

part 'use_router.dart';

/// Called everywhere
final routerProvider = Provider<AppRouter>((_) => AppRouter());

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/register',
      page: RegisterPage,
    ),  AutoRoute(
      path: '/selection/organism',
      page: QuestionVoicePage,
    ),
    AutoRoute(
      path: '/score',
      page: ScorePage,
    ),
    AutoRoute(
      path: '/selection',
      page: SelectionPage,
    ),
    AutoRoute(
      path: '/change_password',
      page: ChangePasswordPage,
    ),
    AutoRoute(
      path: '/waiting',
      page: WaitingPage,
    ),
    AutoRoute(
      path: '/quiz',
      page: QuizPage,
    ),
    AutoRoute(
      path: '/history',
      page: HistoryPage,
    ),
    AutoRoute(
      path: '/personal_study_topics',
      page: PersonalStudyTopicPage,
    ),
    AutoRoute(
      path: '/personal_topics',
      page: PersonalTopicPage,
    ),
    AutoRoute(
      path: '/user_info',
      page: UserInfoPage,
    ),
    AutoRoute(
      path: '/list_vocabulary',
      page: ListVocabularyPage,
    ),
    AutoRoute(
      path: '/list_study_vocabulary',
      page: ListStudyVocabularyPage,
    ),
    AutoRoute(
      path: '/introduce',
      page: IntroducePage,
    ),
    AutoRoute(
      path: '/home',
      page: HomePage,
      children: <AutoRoute>[
        AutoRoute(
          path: 'news',
          page: NewsPage,
        ),
        AutoRoute(
          path: 'discover',
          page: DiscoverPage,
        ),
        AutoRoute(
          path: 'topic',
          page: TopicPage,
        ),
        AutoRoute(
          path: 'practice',
          page: PracticePage,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfilePage,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter._();

  static AppRouter? _instance;

  factory AppRouter() => _instance ??= AppRouter._();
}
