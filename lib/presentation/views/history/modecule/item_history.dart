import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';

import '../../../../core/const/constants.dart';
import '../../../widgets/atom/text_view.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({
    Key? key,
    this.onTap,
    required this.title,
    required this.text,
    required this.timeAt,
  }) : super(key: key);
  final Function()? onTap;
  final String title;
  final String text;
  final String timeAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(
            top: kDefaultPadding,
            right: kDefaultPadding,
            left: kDefaultPadding),
        width: 100.w,
        height: 22.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultThinPadding),
              child: SizedBox(
                width: 77,
                child: TextView(
                 timeAt,
                  fontSize: FontSize.medium,
                  maxLines: 2,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    title,
                    fontSize: FontSize.xHuge,
                    fontColor: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  TextView(
                    text,
                    fontSize: FontSize.medium,
                    fontColor: AppColors.black,
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/images/play.png",
              width: 50,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
