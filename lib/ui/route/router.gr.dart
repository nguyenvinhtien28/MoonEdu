// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_sakura_base/ui/presentation/discover/discover_page.dart' as _i5;
import 'package:flutter_sakura_base/ui/presentation/home/home_page.dart' as _i3;
import 'package:flutter_sakura_base/ui/presentation/login/login_page.dart'
    as _i2;
import 'package:flutter_sakura_base/ui/presentation/news/news_page.dart' as _i4;
import 'package:flutter_sakura_base/ui/presentation/practice/practice_page.dart' as _i10;
import 'package:flutter_sakura_base/ui/presentation/profile/profile_page.dart' as _i11;
import 'package:flutter_sakura_base/ui/presentation/register/register_page.dart'
    as _i8;
import 'package:flutter_sakura_base/ui/presentation/splash/splash_page.dart'
    as _i1;
import 'package:flutter_sakura_base/ui/presentation/topic/topic_page.dart' as _i9;


class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.RegisterPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    NewsRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.NewsPage());
    },
    DiscoverRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.DiscoverPage());
    }  ,
    TopicRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.TopicPage());
    },
    PracticeRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.PracticePage());
    },
    ProfileRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.ProfilePage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(LoginRoute.name, path: '/login'),
        _i6.RouteConfig(RegisterRouter.name, path: '/register'),
        _i6.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i6.RouteConfig(NewsRoute.name, path: 'news', parent: HomeRoute.name),
          _i6.RouteConfig(DiscoverRouter.name, path: 'discover', parent: HomeRoute.name),
          _i6.RouteConfig(TopicRouter.name, path: 'topic', parent: TopicRouter.name),
          _i6.RouteConfig(PracticeRouter.name, path: 'practice', parent: PracticeRouter.name),
          _i6.RouteConfig(ProfileRouter.name, path: 'profile', parent: ProfileRouter.name),
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.Register]
class RegisterRouter extends _i6.PageRouteInfo<void> {
  const RegisterRouter() : super(RegisterRouter.name, path: '/register');

  static const String name = 'RegisterRouter';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.NewsPage]
class NewsRoute extends _i6.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i5.VideoPage]
class DiscoverRouter extends _i6.PageRouteInfo<void> {
  const DiscoverRouter() : super(DiscoverRouter.name, path: 'discover');

  static const String name = 'DiscoverRouter';
}

/// generated route for
/// [_i9.TopicPage]
class TopicRouter extends _i6.PageRouteInfo<void> {
  const TopicRouter() : super(TopicRouter.name, path: 'topic');

  static const String name = 'TopicRouter';
}

/// generated route for
/// [_i10.TopicPage]
class PracticeRouter extends _i6.PageRouteInfo<void> {
  const PracticeRouter() : super(PracticeRouter.name, path: 'practice');

  static const String name = 'PracticeRouter';
}

/// generated route for
/// [_i11.TopicPage]
class ProfileRouter extends _i6.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile');

  static const String name = 'ProfileRouter';
}
