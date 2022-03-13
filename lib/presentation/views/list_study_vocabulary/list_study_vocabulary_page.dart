import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/const/constants.dart';

import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_two.dart';
import '../../widgets/atom/seach_view/item_seach.dart';
import '../../widgets/atom/text_view.dart';

class ListStudyVocabularyPage extends HookConsumerWidget {
  const ListStudyVocabularyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        primary: true,
        automaticallyImplyLeading: false,
        title: const ItemSearch(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextView(
                                "Xin chào",
                                fontColor: AppColors.black,
                                fontSize: FontSize.huge,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Hello  -   ',
                                  style: TextStyle(
                                    fontSize: FontSize.huge,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/heˈləʊ/',
                                        style: TextStyle(
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: ItemBottomNavigationTwo(
        onTap: router.pop,
        more: 'Thêm tự vựng mới',
      ),
    );
  }
}
