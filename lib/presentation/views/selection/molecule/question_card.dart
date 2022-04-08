import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../data/models/AuthenticationQuestionsModel.dart';
import '../../../view_models/selection/selection_view_model.dart';
import 'option.dart';

class QuestionCard extends HookConsumerWidget {
  const QuestionCard({
    Key? key,
    required this.controller,
    required this.question,
  }) : super(key: key);

  final AnimationController controller;
  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionProvider = ref.watch(selectionViewModel);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: AppColors.blue),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
                index: index,
                text: question.options[index],
                press: () {
                  controller.stop();
                  questionProvider.checkAns(question, index);
                  Future.delayed(const Duration(seconds: 3),
                          questionProvider.nextQuestion)
                      .whenComplete(() {
                    controller.reset();
                    controller
                        .forward()
                        .whenComplete(questionProvider.nextQuestion);
                    questionProvider.selected = true;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
