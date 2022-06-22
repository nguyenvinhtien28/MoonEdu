import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';

import '../../../../core/const/constants.dart';
import '../text_view.dart';

class ItemBottomNavigationOne extends StatelessWidget {
  const ItemBottomNavigationOne({Key? key, this.onTap}) : super(key: key);

  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 16.w,
      color: AppColors.blue,
      child: GestureDetector(
        onTap: onTap,

        child: Row(
          children: [
            const SizedBox(width: kDefaultPadding,),
            Image.asset("assets/images/polygon6.png"),
            const SizedBox(width: 6,),
            const TextView(
              "Trở về",
              fontColor: AppColors.white,
              fontSize: FontSize.xLarge,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

