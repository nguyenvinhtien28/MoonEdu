import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/text_view.dart';

import 'package:flutter_svg/svg.dart';


class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: const [
              Spacer(flex: 3),
              TextView("Điểm"),
              Spacer(),
              // Text(
              //   "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline4
              //       ?.copyWith(color: kSecondaryColor),
              // ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
