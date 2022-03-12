import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/const/constants.dart';
import 'package:sizer/sizer.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                text: 'Địa chỉ: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: FontSize.xLarge),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Trường cao đẳng FPT Polytechnic, '
                          'Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, '
                          'Nam Từ Liêm, Hà Nội',
                      style: TextStyle(fontSize: FontSize.xLarge)),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            RichText(
              text: const TextSpan(
                text: 'Email hỗ trợ:  ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: FontSize.xLarge),
                children: <TextSpan>[
                  TextSpan(
                      text: 'phongdsph1135@fpt.edu.vn',
                      style: TextStyle(fontSize: FontSize.xLarge)),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            RichText(
              text: const TextSpan(
                text: 'Số điện thoại hỗ trợ: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: FontSize.xLarge),
                children: <TextSpan>[
                  TextSpan(
                      text: '0838444498',
                      style: TextStyle(fontSize: FontSize.xLarge)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
