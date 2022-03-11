import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/atom/text_view.dart';

class DiscoverPage extends HookConsumerWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/bk_ga.jpg",
                width: 100.w,
                height: 95.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextView(
                            "Học theo chủ đề của bạn",
                            fontColor: AppColors.black,
                            fontSize: FontSize.massive,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Image.asset(
                            "assets/images/reading1.png",
                            width: 120,
                            height: 120,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const TextView(
                            "Học theo chủ đề của bạn",
                            fontColor: AppColors.black,
                            fontSize: FontSize.xLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextView(
                            "Ôn bài cũ",
                            fontColor: AppColors.black,
                            fontSize: FontSize.massive,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Image.asset(
                            "assets/images/studen1.png",
                            width: 120,
                            height: 120,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const TextView(
                            "Bài học dùng khi gặp người mới",
                            fontColor: AppColors.black,
                            fontSize: FontSize.xLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Container(
                      width: 100.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextView(
                            "Bạn biết gì chưa?",
                            fontColor: AppColors.black,
                            fontSize: FontSize.massive,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Image.asset(
                            "assets/images/book1.png",
                            width: 120,
                            height: 120,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const TextView(
                            "Bài học đề xuất",
                            fontColor: AppColors.black,
                            fontSize: FontSize.xLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
