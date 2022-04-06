import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/const/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../ui/components/atom/assets_gen/assets.gen.dart';

class ProgressBar extends HookConsumerWidget {
  const ProgressBar({
    required this.animationValue,
    Key? key,
  }) : super(key: key);

  final double animationValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * animationValue,
              decoration: BoxDecoration(
                gradient: AppColors.kPrimaryGradient,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${(animationValue * 60).round()} sec"),
                  Assets.svgs.clock.svg(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
