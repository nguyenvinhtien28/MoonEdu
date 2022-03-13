library router;

import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
import '../views/register/register_page.dart';
import '../views/selection/selection_page.dart';
import '../views/splash/splash_page.dart';
import '../views/topic/topic_page.dart';
import '../views/user_info/user_info_page.dart';


export 'router.gr.dart';

part 'use_router.dart';

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
    ),
    AutoRoute(
      path: '/selection',
      page: SelectionPage,
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
          page: DiscoverPage,
        ),
        AutoRoute(
          path: 'profile',
          page: TopicPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
