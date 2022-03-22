import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/const/constants.dart';
import '../text_view.dart';


void showSnackBarCustom(
    BuildContext context, {
      required String message,
      required IconData icon,
      Color iconColor = AppColors.blue,
      Duration? duration,
    }) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.none,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 40),
          const SizedBox(width: 15),
          Flexible(
            child: TextView(
              message,
              fontDarkColor: FontColor.white,
              fontColor: FontColor.black,
              fontSize: FontSize.xHuge,
            ),
          ),
        ],
      ),
    ),
  );
}

void hideSnackBarCustom(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}