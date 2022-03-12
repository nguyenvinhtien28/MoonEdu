library router;

import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/ui/presentation/discover/discover_page.dart';
import 'package:flutter_sakura_base/ui/presentation/history/history_page.dart';
import 'package:flutter_sakura_base/ui/presentation/introduce/introduce_page.dart';
import 'package:flutter_sakura_base/ui/presentation/list_study_vocabulary/list_study_vocabulary_page.dart';
import 'package:flutter_sakura_base/ui/presentation/list_vocabulary/list_vocabulary_page.dart';
import 'package:flutter_sakura_base/ui/presentation/login/login_page.dart';
import 'package:flutter_sakura_base/ui/presentation/personal_study_topics/personal_study_topics_page.dart';
import 'package:flutter_sakura_base/ui/presentation/register/register_page.dart';
import 'package:flutter_sakura_base/ui/presentation/selection/selection_page.dart';
import 'package:flutter_sakura_base/ui/presentation/splash/splash_page.dart';
import 'package:flutter_sakura_base/ui/presentation/topic/topic_page.dart';
import 'package:flutter_sakura_base/ui/presentation/user_info/user_info_page.dart';

import '../presentation/home/home_page.dart';
import '../presentation/news/news_page.dart';
import '../presentation/personal_topic/personal_topic_page.dart';

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
