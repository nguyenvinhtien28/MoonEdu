import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/views/user_info/molecule/item_info.dart';
import 'package:flutter_sakura_base/presentation/views/user_info/organism/change_address_dialog.dart';
import 'package:flutter_sakura_base/presentation/views/user_info/organism/change_email_dialog.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../view_models/user/user_info_view_model.dart';
import '../../widgets/atom/text_view.dart';
import 'organism/change_name_dialog.dart';

class UserInfoPage extends HookConsumerWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final userInfoProvider = ref.watch(userViewModelProvider);
    final future = useMemoized(userInfoProvider.userInfo);
    final snapshot = useFuture(future);

    useEffect(() {
      final timer = Timer(const Duration(seconds: 1), () => {});
      final data = snapshot.data;
      debugPrint("------------------------------$data");
      return timer.cancel;
    }, [snapshot.data]);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
              ItemInfo(
                title:
                    "Tên: ${userInfoProvider.name.isEmpty ?
                    snapshot.data!.name : userInfoProvider.name}",
                onTap: () => showChangeNameDialog(
                  context,
                  userInfoProvider.name.toString().isEmpty
                      ? snapshot.data!.name.toString()
                      : userInfoProvider.name,
                ),
              )
            else if (snapshot.hasError)
              Text('${snapshot.error}')
            else
              const CircularProgressIndicator(),

            if (snapshot.hasData)
              ItemInfo(
                title: "Tên đăng nhập: ${snapshot.data!.userName}",
              )
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
            ItemInfo(
              title: "Mật khẩu: ********",
              onTap: () {
                router.push(const ChangePasswordRoute());
              },
            ),
            if (snapshot.hasData)
              ItemInfo(
                title: "Email: ${snapshot.data!.email}",
                onTap: () => showChangeEmailDialog(
                    context, snapshot.data!.email.toString()),
              )
            else if (snapshot.hasError)
              Text('${snapshot.error}')
            else
              const CircularProgressIndicator(),

            if (snapshot.hasData)
              ItemInfo(
                title:
                    "Ngày sinh: ${userInfoProvider.birth.isEmpty ?
                    snapshot.data!.birth : userInfoProvider.birth}",
                onTap: () {
                  final Picker picker = Picker(
                    adapter: DateTimePickerAdapter(
                      type: PickerDateTimeType.kDMY,
                      isNumberMonth: true,
                      yearSuffix: "",
                      monthSuffix: "",
                      daySuffix: "",
                      yearBegin: 1950,
                      yearEnd: 2022,
                    ),

                    title: const TextView(
                      "Ngày sinh",
                      fontSize: FontSize.xLarge,
                      fontColor: AppColors.black,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ),
                    confirmText: "Xác nhận",
                    cancelText: "Huỷ",
                    hideHeader: true,
                    onConfirm: (Picker picker, List value) {
                      userInfoProvider.birth = picker.adapter.text
                          .substring(0, 10)
                          .split('-')
                          .reversed
                          .join();
                      userInfoProvider.updateBirth();
                    },
                  );
                  picker.showDialog(context);
                },
              )
            else if (snapshot.hasError)
              Text('${snapshot.error}')
            else
              const CircularProgressIndicator(),

            if (snapshot.hasData)
              ItemInfo(
                title:
                    "Giới tính: ${userInfoProvider.gender.isEmpty ?
                    snapshot.data!.gender : userInfoProvider.gender}",
                onTap: () {
                  final Picker picker = Picker(
                      adapter: PickerDataAdapter<String>(
                        pickerdata: const JsonDecoder().convert(pickerData),
                      ),
                      changeToFirst: false,
                      textAlign: TextAlign.left,
                      hideHeader: true,
                      title: const TextView(
                        "Giới Tính",
                        fontSize: FontSize.xLarge,
                        fontColor: AppColors.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                      height: 25.w,
                      columnPadding: const EdgeInsets.all(8.0),
                      confirmText: "Xác nhận",
                      cancelText: "Huỷ",
                      onConfirm: (Picker picker, List value) {
                        debugPrint(value.last.toString());
                        debugPrint(picker.getSelectedValues().join(""));
                        userInfoProvider.gender =
                            picker.getSelectedValues().join("");
                        userInfoProvider.updateGender();
                      });
                  picker.showDialog(context);
                },
              )
            else if (snapshot.hasError)
              Text('${snapshot.error}')
            else
              const CircularProgressIndicator(),
            if (snapshot.hasData)
              ItemInfo(
                title:
                    "Địa chỉ: ${userInfoProvider.address.isEmpty ?
                    snapshot.data!.address : userInfoProvider.address}",
                onTap: () async {
                  await showChangeAddressDialog(
                    context,
                    userInfoProvider.address.toString().isEmpty
                        ? snapshot.data!.address.toString()
                        : userInfoProvider.address,
                  );
                },
              )
            else if (snapshot.hasError)
              Text('${snapshot.error}')
            else
              const CircularProgressIndicator(),
          ],
        ),
      )),
      bottomNavigationBar: ItemBottomNavigationOne(
        onTap: router.pop,
      ),
    );
  }
}

const pickerData = '''
[
    "Nam",
    "Nữ",
    "Khác"
]
    ''';
