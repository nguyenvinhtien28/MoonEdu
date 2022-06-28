import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/views/login/molecule/body_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      /// ngăn không có các widget đẩy lên khi bật bàn phím
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            const BodyLogin(),
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
