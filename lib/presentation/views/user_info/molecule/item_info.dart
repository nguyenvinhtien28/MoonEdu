import 'package:flutter/material.dart';

import '../../../../core/const/constants.dart';
import '../../../widgets/atom/text_view.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key? key, required this.title, this.onTap})
      : super(key: key);
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultExThinPadding),
      child: GestureDetector(
        onTap:onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextView(
                title,
                fontSize: FontSize.xLarge,
                fontColor: AppColors.black,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500,
                maxLines: 2,
              ),
            ),
            Image.asset(
              "assets/images/play.png",
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
