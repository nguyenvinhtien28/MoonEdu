import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/ui/components/atom/text_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../const/constants.dart';

class TopicPage extends HookConsumerWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/saohonhtim1.png",
                        width: 80,
                        height: 80,
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
                              "Bài học dùng khi gặp người mới",
                              fontSize: FontSize.medium,
                              fontColor: AppColors.black,
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/play.png",
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}