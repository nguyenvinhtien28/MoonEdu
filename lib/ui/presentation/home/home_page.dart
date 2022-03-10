import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/atom/assets_gen/assets.gen.dart';
import '../../route/router.gr.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        NewsRoute(),
        VideoRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: tabsRouter.setActiveIndex,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.news.svg(
                width: 20,
                color: tabsRouter.current.name == NewsRoute.name
                    ? kLightThemeData.accentColor
                    : kLightThemeData.disabledColor,
              ),
              label: 'New',
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.video.svg(
                width: 20,
                color: tabsRouter.current.name == VideoRoute.name
                    ? kLightThemeData.accentColor
                    : kLightThemeData.disabledColor,
              ),
              label: 'Video',
            ),
          ],
        );
      },
    );
  }
}
