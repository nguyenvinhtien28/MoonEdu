import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:flutter_sakura_base/ui/components/atom/text_view.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsPage extends HookConsumerWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/bk_ga_2.jpg",
                width: 100.w,
                height: 90.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.blue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/text11.png"),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          const TextView(
                            "Những bài học được đề xuất giành cho bạn",
                            fontColor: FontColor.white,
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Container(
                            width: 70.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: AppColors.blue,
                                  size: 50,
                                ),
                                TextView(
                                  "Bắt đầu học",
                                  fontColor: AppColors.blue,
                                  fontSize: FontSize.massive,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultWidePadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 42.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.blue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextView(
                                "Học tự do",
                                fontColor: AppColors.white,
                                fontSize: FontSize.xLarge,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Image.asset("assets/images/loaphatthanh.png"),
                            ],
                          ),
                        ),
                        Container(
                          width: 42.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.blue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextView(
                                "Học theo chủ đề",
                                fontColor: AppColors.white,
                                fontSize: FontSize.xLarge,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Image.asset("assets/images/phatam1.png"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultWidePadding,
                    ),
                    Container(
                      width: 100.w,
                      height: 26.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.blue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextView(
                            "Học theo chủ đề của bạn",
                            fontColor: AppColors.white,
                            fontSize: FontSize.xLarge,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Image.asset("assets/images/saohonhtim1.png",width: 151,height: 151,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
