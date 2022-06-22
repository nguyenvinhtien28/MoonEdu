import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/view_models/user/profile_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../view_models/user/user_info_view_model.dart';
import '../../widgets/atom/text_view.dart';
import 'molecule/item_profile.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final profileProvider = ref.watch(profileViewModelProvider);
    final userInfoProvider = ref.watch(userViewModelProvider);
    final future = useMemoized(userInfoProvider.userInfo);
    final snapshot = useFuture(future);

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
                    children: [
                      if (snapshot.hasData)
                        TextView(
                          userInfoProvider.name.isEmpty
                              ? snapshot.data!.name.toString()
                              : userInfoProvider.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontColor: AppColors.white,
                        )
                      else if (snapshot.hasError)
                        Text('${snapshot.error}')
                      else
                        const CircularProgressIndicator(),
                      const SizedBox(
                        height: 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          router.push(const UserInfoRoute());
                        },
                        child: const TextView(
                          "Xem thông tin của bạn",
                          fontSize: FontSize.large,
                          fontColor: AppColors.white,
                        ),
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
            ItemProfile(
              image: "assets/images/book1.png",
              title: "Chủ đề học của bạn",
              onTap: () {
                router.push(const PersonalStudyTopicRoute());
              },
            ),
            ItemProfile(
              image: "assets/images/danhsachtuvung1.png",
              title: "Từ vựng của bạn",
              onTap: () => router.push(const ListStudyVocabularyRoute()),
            ),
            ItemProfile(
              image: "assets/images/call.png",
              title: "Liên hệ với chúng tôi",
              onTap: () => router.push(const WaitingRoute()),
            ),
            ItemProfile(
              image: "assets/images/text11.png",
              title: "Giới thiệu",
              onTap: () => router.push(const IntroduceRoute()),
            ),
            ItemProfile(
              image: "assets/images/pngegg1.png",
              title: "Đăng xuất",
              onTap: profileProvider.logOut,
            ),
          ],
        ),
      ),
    );
  }
}
