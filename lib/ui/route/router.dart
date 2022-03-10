library router;

import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/ui/presentation/login/login_page.dart';
import 'package:flutter_sakura_base/ui/presentation/splash/splash_page.dart';

import '../presentation/home/home_page.dart';
import '../presentation/news/news_page.dart';
import '../presentation/video/video_page.dart';

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
      path: '/home',
      page: HomePage,
      children: <AutoRoute>[
        AutoRoute(
          path: 'news',
          page: NewsPage,
        ),
        AutoRoute(
          path: 'video',
          page: VideoPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
