import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';


import '../../../../core/const/constants.dart';
import '../../../widgets/atom/text_view.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile(
      {Key? key, required this.image, required this.title, this.onTap})
      : super(key: key);
  final String image;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              height: 10.w,
            ),
          ),
           TextView(
            title,
            fontWeight: FontWeight.bold,
            fontSize: FontSize.huge,
            fontColor: AppColors.black,
          )
        ],
      ),
    );
  }
}
