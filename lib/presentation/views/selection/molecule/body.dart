import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/presentation/view_models/selection/selection_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/const/constants.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends HookConsumerWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizProvider = ref.watch(selectionViewModel);
    quizProvider.onInit();
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kDefaultFatPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultExThinPadding,
                ),
                child: ProgressBar(animationValue: quizProvider.animation),
              ),
              const SizedBox(
                height: kDefaultFatPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Text.rich(
                  TextSpan(
                    text: "Câu hỏi: ${quizProvider.questionNumber}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: AppColors.black),
                    children: [
                      TextSpan(
                        text: "/${quizProvider.questions.length}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(
                height: kDefaultWidePadding,
              ),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizProvider.questions.length,
                  controller: quizProvider.pageController,
                  onPageChanged: quizProvider.updateTheQnNum,
                  itemBuilder: (context, index) => QuestionCard(
                    question: quizProvider.questions[index],
                    controller: quizProvider.animationController,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
