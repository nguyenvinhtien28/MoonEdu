import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/presentation/view_models/question/question_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../data/models/QuestionsModel.dart';
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
    final loginProvider = ref.watch(questionViewModel);

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
                  loginProvider.checkAns(question, index);
                  Future.delayed(const Duration(seconds: 3),
                          loginProvider.nextQuestion)
                      .whenComplete(() {
                    controller.reset();
                    controller
                        .forward()
                        .whenComplete(loginProvider.nextQuestion);
                    loginProvider.selected = true;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
