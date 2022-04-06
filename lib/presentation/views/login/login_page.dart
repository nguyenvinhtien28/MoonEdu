import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/view_models/login/login_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../widgets/atom/button/button.dart';
import '../../widgets/atom/glass_morphism_text_area/glass_morphism_text_area.dart';
import '../../widgets/atom/text_area/text_area.dart';
import '../../widgets/atom/text_view.dart';


class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final loginProvider = ref.watch(loginViewModelProvider);
    final formKey = useMemoized(GlobalKey<FormState>.new);
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
                height: 53.h,
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
                        const TextView(Messages.userName,
                            fontSize: 18, fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        GlassMorphismTextArea(
                          hintText: Messages.userName,
                          icon: Icons.account_circle_outlined,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            loginProvider.username = value!;
                          },
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const TextView(Messages.password,
                            fontSize: 18, fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        GlassMorphismTextArea(
                          hintText: Messages.password,
                          textType: TextType.text,
                          icon: Icons.lock_outline,
                          onChange: (value) {
                            if (loginProvider.errorMessage.isEmpty){
                              return ;
                            }
                            loginProvider.errorMessage = "";
                          },
                          obscureText: true,
                          onSaved: (value) {
                            loginProvider.password = value!;
                          },
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const TextView(
                          "Bạn quên mật khẩu?",
                          fontSize: 14,
                        ),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        TextView(
                          loginProvider.errorMessage,
                          fontSize: 14,
                          fontColor: FontColor.red,
                        ),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        Button(Messages.login, onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            loginProvider.login();
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
                              "Bạn chưa có tài khoản?",
                              fontSize: 14,
                              fontColor: AppColors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                router.replaceAll([const RegisterRoute()]);
                              },
                              child: const TextView(
                                Messages.register,
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
                top: 32.h,
                left: 14.w,
                child: Image.asset("assets/images/logotext.png"))
          ],
        ),
      ),
    );
  }
}
