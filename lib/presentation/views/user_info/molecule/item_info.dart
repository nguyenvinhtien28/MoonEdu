import 'package:flutter/material.dart';

import '../../../../core/const/constants.dart';
import '../../../widgets/atom/text_view.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultExThinPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            title,
            fontSize: FontSize.xLarge,
            fontColor: AppColors.black,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          Image.asset(
            "assets/images/play.png",
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
