import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/const/constants.dart';
import 'package:flutter_sakura_base/presentation/view_models/question/question_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final optionProvider = ref.watch(questionViewModel);
      Color getTheRightColor() {
        if (optionProvider.isAnswered) {
          if (index == optionProvider.correctAns) {
            return Colors.green;
          } else if (index == optionProvider.selectedAns &&
              optionProvider.selectedAns != optionProvider.correctAns) {
            return Colors.red;
          }
        }
        return AppColors.grey;
      }

      IconData getTheRightIcon() {
        return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
      }

      return IgnorePointer(
        ignoring: !optionProvider.selected,
        child: InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. $text",
                  style: TextStyle(color: getTheRightColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == Colors.red
                        ? Colors.red
                        : getTheRightColor() == Colors.green
                            ? Colors.green
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: getTheRightColor() == Colors.red
                            ? Colors.red
                            : getTheRightColor() == Colors.green
                                ? Colors.green
                                : Colors.transparent),
                  ),
                  child: getTheRightColor() == AppColors.grey
                      ? null
                      : Icon(getTheRightIcon(), size: 16),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
