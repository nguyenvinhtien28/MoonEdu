import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/ui/route/router.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';
import 'package:flutter_sakura_base/utils/responsive.dart';

import '../../../const/constants.dart';
import '../../components/atom/button/glass_morphism_button.dart';
import '../../components/atom/circle_paint.dart';
import '../../components/atom/glass_morphism.dart';
import '../../components/atom/text_area/text_area.dart';
import '../../components/atom/text_view.dart';
import '../../components/hook/login_page/animation_value.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: _BackgroundLoginPage(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile ? 5.w : 15.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: TextView(
                    Messages.appName,
                    fontSize: 18.sp,
                    fontColor: FontColor.white,
                    fontDarkColor: FontColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                _GlassMorphismTextArea(
                  hintText: 'User name...',
                  icon: Icons.account_circle_outlined,
                  onSaved: (value) {},
                ),
                const SizedBox(height: kDefaultPadding),
                _GlassMorphismTextArea(
                  hintText: 'Email...',
                  textType: TextType.email,
                  icon: Icons.email_outlined,
                  onSaved: (value) {},
                ),
                const SizedBox(height: kDefaultPadding),
                _GlassMorphismTextArea(
                  hintText: 'Password...',
                  textType: TextType.password,
                  icon: Icons.lock_outline,
                  onSaved: (value) {},
                ),
                const SizedBox(height: kDefaultWidePadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlassMorphismButton(
                      text: 'LOGIN',
                      onTap: () {
                        router.replaceAll([const HomeRoute()]);
                      },
                    ),
                    const SizedBox(width: kDefaultExThinPadding),
                    GlassMorphismButton(
                      text: 'Forgotten password!',
                      onTap: () {},
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: GlassMorphismButton(
                    text: 'Create a new Account',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
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
        textLightColor: AppColors.white,
        textType: textType ?? TextType.text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultThinPadding),
          child: Icon(
            icon,
            color: AppColors.white.withOpacity(.7),
          ),
        ),
      ),
    );
  }
}

class _BackgroundLoginPage extends HookWidget {
  const _BackgroundLoginPage({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final values = useBackgroundAnimationValues();

    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(color: AppColors.black),
          ),
          _circlePositioned(
            top: 100.h * (values[1] + .58),
            left: 100.w * .21,
            radius: 50,
          ),
          _circlePositioned(
            top: 100.h * .98,
            left: 100.w * .1,
            radius: values[3] - 30,
          ),
          _circlePositioned(
            top: 100.h * .5,
            left: 100.w * (values[1] + .8),
            radius: 30,
          ),
          _circlePositioned(
            top: 100.h * values[2],
            left: 100.w * (values[1] + .1),
            radius: 60,
          ),
          _circlePositioned(
            top: 100.h * .1,
            left: 100.w * .8,
            radius: values[3],
          ),
          child,
        ],
      ),
    );
  }

  Positioned _circlePositioned({
    required final double top,
    required final double left,
    required final double radius,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: CirclePaint(radius),
    );
  }

  List<double> useBackgroundAnimationValues() {
    final ctrl1 = useAnimationController(duration: const Duration(seconds: 5));

    final ctrl2 = useAnimationController(duration: const Duration(seconds: 5));

    return useAnimationValues(ctrl1, ctrl2);
  }
}
