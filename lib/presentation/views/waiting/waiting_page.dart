import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';

class WaitingPage extends HookConsumerWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), router.pop);
      return;
    }, const []);
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Địa chỉ: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.xLarge,
                    color: FontColor.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Trường cao đẳng FPT Polytechnic, '
                          'Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, '
                          'Nam Từ Liêm, Hà Nội',
                      style: TextStyle(
                        fontSize: FontSize.xLarge,
                        fontWeight: FontWeight.normal,
                      )),
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
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.xLarge,
                    color: FontColor.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'phongdsph1135@fpt.edu.vn',
                      style: TextStyle(
                        fontSize: FontSize.xLarge,
                        fontWeight: FontWeight.normal,
                      )),
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
                    color: FontColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.xLarge),
                children: <TextSpan>[
                  TextSpan(
                      text: '0838444498',
                      style: TextStyle(
                        fontSize: FontSize.xLarge,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
