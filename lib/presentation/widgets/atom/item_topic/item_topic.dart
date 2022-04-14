import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';

import '../../../../core/const/constants.dart';
import '../../../widgets/atom/text_view.dart';

class ItemTopic extends StatelessWidget {
  const ItemTopic({
    Key? key,
    required this.nameTopic,
    required this.description,
     this.img,
    this.onTap,
  }) : super(key: key);

  final String? img;
  final String nameTopic;
  final String description;
  final Function()? onTap;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/play.png",
              width: 80,
              height: 80,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    nameTopic,
                    fontSize: FontSize.xHuge,
                    fontColor: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  TextView(
                    description,
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
