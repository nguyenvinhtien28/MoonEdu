import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/views/user_info/molecule/item_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../view_models/user/user_info_view_model.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/text_view.dart';

class UserInfoPage extends HookConsumerWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final userInfoProvider = ref.read(userViewModelProvider(router));
    final future = useMemoized(userInfoProvider.userInfo);
    final snapshot = useFuture(future);
    useEffect(
      () {
        final timer = Timer(const Duration(seconds: 1), () =>{});
        final data = snapshot.data;
        print(data);
        return timer.cancel;
      }, [snapshot.data]
    );
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
          if (snapshot.hasData)
            ItemInfo(title: "Tên đăng nhập: ${snapshot.data!.userName}")
          else if (snapshot.hasError)
            Text('${snapshot.error}')
          else
            const CircularProgressIndicator(),
          // FutureBuilder<AuthenticationUser>(
          //   future: future,
          //   builder: (context, snapshot) {
          //
          //     if (snapshot.hasData) {
          //       return ItemInfo(
          //           title: "Tên đăng nhập: ${snapshot.data!.userName}");
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),
          const ItemInfo(title:  "Mật khẩu: ********",),
          if (snapshot.hasData)
            ItemInfo(title: "Email: ${snapshot.data!.email}")
          else if (snapshot.hasError)
            Text('${snapshot.error}')
          else
            const CircularProgressIndicator(),

          if (snapshot.hasData)
            ItemInfo(title: "Ngày sinh: ${snapshot.data!.birth}")
          else if (snapshot.hasError)
            Text('${snapshot.error}')
          else
            const CircularProgressIndicator(),

          if (snapshot.hasData)
            ItemInfo(title: "Giới tính: ${snapshot.data!.gender}")
          else if (snapshot.hasError)
            Text('${snapshot.error}')
          else
            const CircularProgressIndicator(),
          if (snapshot.hasData)
            ItemInfo(title: "Địa chỉ: ${snapshot.data!.address}")
          else if (snapshot.hasError)
            Text('${snapshot.error}')
          else
            const CircularProgressIndicator(),
        ],
      )),
      bottomNavigationBar: ItemBottomNavigationOne(onTap: router.pop),
    );
  }
}
