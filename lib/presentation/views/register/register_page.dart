import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/view_models/login/register_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../widgets/atom/button/button.dart';
import '../../widgets/atom/glass_morphism_text_area/glass_morphism_text_area.dart';
import '../../widgets/atom/text_area/text_area.dart';
import '../../widgets/atom/text_view.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router = useRouter();
    final registerProvider = ref.watch(registerViewModelProvider(router));
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bk_login.png"),
                    alignment: FractionalOffset.topCenter),
                color: AppColors.blue,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                height: 58.h,
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultWidePadding,
                      right: kDefaultWidePadding,
                      top: kDefaultWidePadding),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextView("Tên đăng nhập",
                            fontSize: 18, fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        GlassMorphismTextArea(
                          hintText: Messages.userName,
                          icon: Icons.account_circle_outlined,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            registerProvider.username = value!;
                          },
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const TextView("Email",
                            fontSize: 18, fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        GlassMorphismTextArea(
                          hintText: Messages.email,
                          textType: TextType.email,
                          icon: Icons.email_outlined,
                          onSaved: (value) {
                            registerProvider.email = value!;
                          },
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const TextView("Mật khẩu",
                            fontSize: 18, fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        GlassMorphismTextArea(
                          hintText: Messages.password,
                          textType: TextType.text,
                          icon: Icons.lock_outline,
                          obscureText: true,
                          onSaved: (value) {
                            registerProvider.password = value!;
                          },
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Button("Đăng ký", onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            registerProvider.register();
                          }
                        }),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextView(
                              "Bạn đã có tài khoản?",
                              fontSize: 14,
                              fontColor: AppColors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                router.replaceAll([const LoginRoute()]);
                              },
                              child: const TextView(
                                " Đăng nhập",
                                fontSize: 14,
                                fontColor: AppColors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 27.h,
                left: 14.w,
                child: Image.asset("assets/images/logotext.png"))
          ],
        ),
      ),
    );
  }
}
