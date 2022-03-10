import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:flutter_sakura_base/ui/route/router.gr.dart';
import 'package:flutter_sakura_base/utils/responsive.dart';

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(AppRouter.new);
    return _AppResponsive(
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

class _AppResponsive extends HookWidget {
  const _AppResponsive({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Responsive.setResponsive(constraints, orientation);

            return child;
          },
        );
      },
    );
  }
}
