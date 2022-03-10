import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/constants.dart';
import '../../components/atom/text_view.dart';
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
      body: Center(
        child: Shimmer.fromColors(
          baseColor: AppColors.pink,
          highlightColor: AppColors.white,
          child: TextView(
            Messages.appName,
            fontSize: FontSize.xHuge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
