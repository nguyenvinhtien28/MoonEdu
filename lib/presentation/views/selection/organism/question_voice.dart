import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ui/components/atom/assets_gen/assets.gen.dart';
import '../molecule/body.dart';

class QuestionVoicePage extends HookConsumerWidget {
  const QuestionVoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(children: [
          Assets.images.bkGa2.image(
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
