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
        DiscoverRouter(),
        TopicRouter(),
        PracticeRouter(),
        ProfileRouter(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: AppColors.blue,
          selectedItemColor: AppColors.white,
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.house.svg(
                width: 20,
                color: tabsRouter.current.name == NewsRoute.name
                    ? AppColors.white
                    : kLightThemeData.disabledColor,
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.discover.svg(
                width: 20,
                color: tabsRouter.current.name == DiscoverRouter.name
                    ? AppColors.white
                    : kLightThemeData.disabledColor,
              ),
              label: 'Khám phá',
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.topic.svg(
                width: 20,
                color: tabsRouter.current.name == TopicRouter.name
                    ? AppColors.white
                    : kLightThemeData.disabledColor,
              ),
              label: 'Bài học',
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.practice.svg(
                width: 20,
                color: tabsRouter.current.name == PracticeRouter.name
                    ? AppColors.white
                    : kLightThemeData.disabledColor,
              ),
              label: 'Luyện tập',
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.profile.svg(
                width: 20,
                color: tabsRouter.current.name == ProfileRouter.name
                    ? AppColors.white
                    : kLightThemeData.disabledColor,
              ),
              label: 'Cá nhân',
            ),
          ],
        );
      },
    );
  }
}
