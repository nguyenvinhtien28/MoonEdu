import 'package:flutter/material.dart';

import '../../../../core/const/constants.dart';
import '../text_view.dart';

class ItemVocabulary extends StatelessWidget {
  const ItemVocabulary({
    Key? key,
    required this.textEN,
    required this.textVN,
    this.onTap,
    required this.pronounce,
  }) : super(key: key);
  final String textEN;
  final String textVN;
  final String pronounce;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultExThinPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        textVN,
                        fontColor: AppColors.black,
                        fontSize: FontSize.huge,
                      ),
                      RichText(
                        text: TextSpan(
                          text: textEN,
                          style: const TextStyle(
                            fontSize: FontSize.huge,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children:  <TextSpan>[
                            TextSpan(
                                text: '  -  /$pronounce/',
                                style: const TextStyle(
                                  color: AppColors.blue,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/loa1.png",
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
