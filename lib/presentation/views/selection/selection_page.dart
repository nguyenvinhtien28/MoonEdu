import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/text_view.dart';
import 'molecule/item_selection.dart';

class SelectionPage extends HookConsumerWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/bk_ga_2.jpg",
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ItemSelection(
                          title: "Bắt đầu với",
                          image: "assets/images/iconl1.png",
                        ),
                        ItemSelection(
                          title: "Bắt đầu với",
                          image: "assets/images/iconll1.png",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultWidePadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 42.w,
                          height: 23.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.blue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextView(
                                "Bắt đầu với",
                                fontColor: AppColors.white,
                                fontSize: FontSize.xHuge,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 41,
                                    height: 82,
                                    color: AppColors.blue[300],
                                    child:
                                        Image.asset("assets/images/loa1.png"),
                                  ),
                                  Image.asset("assets/images/iconll1.png"),
                                ],
                              )
                            ],
                          ),
                        ),
                        const ItemSelection(
                          title: "Bắt đầu với",
                          image: "assets/images/vroup31.png",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultWidePadding,
                    ),
                    Container(
                      width: 100.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.blue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextView(
                            "Xem dánh sách từ",
                            fontColor: AppColors.white,
                            fontSize: FontSize.xHuge,
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ItemBottomNavigationOne(onTap: router.pop),
    );
  }
}
