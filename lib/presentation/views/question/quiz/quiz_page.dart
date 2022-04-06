import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/body.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            "assets/images/bk_ga_2.jpg",
            width: 100.w,
            height: 100.h,
            fit: BoxFit.fill,
          ),
          const Body()
        ]),
      ),
    );
  }
}
