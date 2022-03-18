import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/const/constants.dart';
import '../route/router.gr.dart';
import 'app_responsive.dart';

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(AppRouter.new);
    return AppResponsive(
      child: MaterialApp.router(
        title: 'Moon Edu',
        theme: kLightThemeData,
        darkTheme: kDarkThemeData,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}
