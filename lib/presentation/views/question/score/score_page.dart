import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/const/constants.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/text_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../ui/components/atom/assets_gen/assets.gen.dart';
import '../../../view_models/question/question_view_model.dart';

class ScorePage extends HookConsumerWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizProvider = ref.watch(questionViewModel);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.bkGa2.image(
            width: 100.w,
            height: 100.h,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              const TextView(
                "Điểm",
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
              TextView(
                "${quizProvider.numOfCorrectAns}/${quizProvider.questions.length}",
                fontSize: 45,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.blue,
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
