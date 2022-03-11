import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';

import '../../../../const/constants.dart';
import '../../../components/atom/text_view.dart';

class ItemPractice extends StatelessWidget {
  const ItemPractice(
      {Key? key, required this.image, required this.title, this.onTap})
      : super(key: key);
  final String image;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(kDefaultExThinPadding),
        margin: const EdgeInsets.only(
          top: kDefaultWidePadding,
        ),
        width: 43.w,
        height: 42.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 95,
              height: 95,
            ),
            TextView(
              title,
              fontSize: FontSize.xLarge,
              fontColor: AppColors.black,
              fontWeight: FontWeight.bold,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
