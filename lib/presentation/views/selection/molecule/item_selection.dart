import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';

import '../../../../core/const/constants.dart';
import '../../../widgets/atom/text_view.dart';

class ItemSelection extends StatelessWidget {
  const ItemSelection({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.w,
      height: 23.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
            title,
            fontColor: AppColors.white,
            fontSize: FontSize.xHuge,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}
