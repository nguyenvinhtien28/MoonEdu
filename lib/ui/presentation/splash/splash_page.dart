import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../const/constants.dart';
import '../../route/router.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        router.replace(const LoginRoute());
      });

      return;
    }, const []);

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Container(
        width: 100.w,
        height: 80.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ellipse1.png"),
                fit: BoxFit.fill)),
        child: Center(
          child: SizedBox(
              child: Image.asset("assets/images/text1.jpg",width: 266,)),
        ),
      ),
    );
  }
}
