import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/text_view.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final router = useRouter();
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bk_ga.jpg'),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(
                        top: kDefaultPadding,
                        right: kDefaultPadding,
                        left: kDefaultPadding),
                    width: 100.w,
                    height: 22.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(kDefaultThinPadding),
                          child: TextView("14-01-2022 \n10/10",fontSize: FontSize.medium,),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              TextView(
                                "Chủ đề 1",
                                fontSize: FontSize.xHuge,
                                fontColor: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              TextView(
                                "Game 2",
                                fontSize: FontSize.medium,
                                fontColor: AppColors.black,
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/images/play.png",
                          width: 50,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: ItemBottomNavigationOne(onTap: router.pop),
    );
  }
}