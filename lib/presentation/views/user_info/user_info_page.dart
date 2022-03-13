import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/text_view.dart';

class UserInfoPage extends HookConsumerWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 20.h,
            width: 100.w,
            color: AppColors.blue,
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  "Tổng số bài học \n 10",
                  fontSize: FontSize.medium,
                  fontColor: AppColors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white),
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Image.asset(
                          "assets/images/text11.png",
                          fit: BoxFit.fill,
                          height: 14.w,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const Expanded(
                      child: TextView(
                        "Người dùng pro",
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.xHuge,
                        fontColor: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                const TextView(
                  "Tổng số số điểm\n 90/100",
                  fontSize: FontSize.medium,
                  fontColor: AppColors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultExThinPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  "Tên đăng nhập: admin",
                  fontSize: FontSize.xLarge,
                  fontColor: AppColors.black,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                Image.asset(
                  "assets/images/play.png",
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultExThinPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  "Mật khẩu: ********",
                  fontSize: FontSize.xLarge,
                  fontColor: AppColors.black,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                Image.asset(
                  "assets/images/play.png",
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultExThinPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextView(
                  "Email: moonedu@fpt.edu.vn",
                  fontSize: FontSize.xLarge,
                  fontColor: AppColors.black,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                Image.asset(
                  "assets/images/play.png",
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: ItemBottomNavigationOne(onTap: router.pop),
    );
  }
}
