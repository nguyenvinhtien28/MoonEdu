import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

import '../../core/const/constants.dart';
import '../../core/utils/responsive.dart';
import '../route/router.gr.dart';

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(AppRouter.new);
    return Sizer(builder: (context, orientation, deviceType) {
      return _AppResponsive(
        child: MaterialApp.router(
          title: 'Moon Edu',
          theme: kLightThemeData,
          darkTheme: kDarkThemeData,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
        ),
      );
    });
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
