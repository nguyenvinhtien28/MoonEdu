import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';
import '../../../core/const/constants.dart';
import '../../route/router.dart';
import '../../widgets/atom/button/button.dart';
import '../../widgets/atom/glass_morphism.dart';
import '../../widgets/atom/text_area/text_area.dart';
import '../../widgets/atom/text_view.dart';


class RegisterPage extends HookWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextView("Tên đăng nhập",
                          fontSize: 18, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: kDefaultExThinPadding,
                      ),
                      _GlassMorphismTextArea(
                        hintText: 'Tên đăng nhập',
                        icon: Icons.email_outlined,
                        onSaved: (value) {},
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const TextView("Email",
                          fontSize: 18, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: kDefaultExThinPadding,
                      ),
                      _GlassMorphismTextArea(
                        hintText: 'Email',
                        icon: Icons.account_circle_outlined,
                        onSaved: (value) {},
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const TextView("Mật khẩu",
                          fontSize: 18, fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: kDefaultExThinPadding,
                      ),
                      _GlassMorphismTextArea(
                        hintText: 'Password...',
                        textType: TextType.password,
                        icon: Icons.lock_outline,
                        onSaved: (value) {},
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Button("Đăng ký", onPressed: () {}),
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

class _GlassMorphismTextArea extends HookWidget {
  const _GlassMorphismTextArea({
    Key? key,
    this.textType,
    required this.hintText,
    required this.icon,
    required this.onSaved,
  }) : super(key: key);

  final TextType? textType;
  final String hintText;
  final IconData icon;
  final ValueChanged<String?> onSaved;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      child: TextArea(
        onSaved: onSaved,
        labelText: hintText,
        hintText: hintText,
        isGlassMorphismStyle: true,
        textLightColor: AppColors.black,
        textType: textType ?? TextType.text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultThinPadding),
          child: Icon(
            icon,
            color: AppColors.blue,
            size: 30,
          ),
        ),
      ),
    );
  }
}