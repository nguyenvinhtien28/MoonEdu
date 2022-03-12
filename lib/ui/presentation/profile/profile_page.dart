import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:flutter_sakura_base/ui/components/atom/text_view.dart';
import 'package:flutter_sakura_base/ui/presentation/profile/molecule/item_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 18.h,
              width: 100.w,
              color: AppColors.blue,
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20.w,
                    height: 20.w,
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
                    width: kDefaultThinPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextView(
                        "Moon Edu",
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontColor: AppColors.white,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextView(
                        "Xem thông tin của bạn",
                        fontSize: FontSize.large,
                        fontColor: AppColors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ItemProfile(
              image: "assets/images/kisspng-game.png",
              title: "Chơi game",
            ),
            const ItemProfile(
              image: "assets/images/book1.png",
              title: "Chủ đề học của bạn",
            ),
            const ItemProfile(
              image: "assets/images/danhsachtuvung1.png",
              title: "Từ vựng của bạn",
            ),
            const ItemProfile(
              image: "assets/images/call.png",
              title: "Liên hệ với chúng tôi",
            ),
            const ItemProfile(
              image: "assets/images/text11.png",
              title: "Giới thiệu",
            ),
            const ItemProfile(
              image: "assets/images/pngegg1.png",
              title: "Đăng xuất",
            ),
          ],
        ),
      ),
    );
  }
}