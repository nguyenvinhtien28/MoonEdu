import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/const/constants.dart';
import '../../route/router.dart';

class IntroducePage extends HookConsumerWidget {
  const IntroducePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router = useRouter();
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), router.pop);
      return;
    }, const []);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Column(
          children: const <Widget>[
            Text(
              Messages.textIntroduce,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
