import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/utils/extension/num.dart';

import '../../../../const/constants.dart';
import '../text_view.dart';

class ItemBottomNavigationTwo extends StatelessWidget {
  const ItemBottomNavigationTwo(
      {Key? key, this.onTap, required this.more, this.onMoreTap})
      : super(key: key);

  final GestureTapCallback? onTap;
  final GestureTapCallback? onMoreTap;
  final String more;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 16.w,
      color: AppColors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: kDefaultPadding,
              ),
              Image.asset("assets/images/polygon6.png"),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: onTap,
                child: const TextView(
                  "Trở về",
                  fontColor: AppColors.white,
                  fontSize: FontSize.xLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: kDefaultPadding,
              ),
              Image.asset("assets/images/more.png"),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: onMoreTap,
                child: TextView(
                  more,
                  fontColor: AppColors.white,
                  fontSize: FontSize.xLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
