import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/const/constants.dart';
import '../../route/router.dart';
import 'molecule/item_pratice.dart';

class PracticePage extends HookConsumerWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bk_ga.jpg'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemPractice(
                        image: "assets/images/book1.png",
                        title: "Danh sách chủ đề",
                        onTap: () => router.push(const PersonalTopicRoute()),
                      ),
                      ItemPractice(
                        image: "assets/images/book1.png",
                        title: "Danh sách chủ đề cá nhân",
                        onTap: () =>
                            router.push(const PersonalStudyTopicRoute()),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemPractice(
                        image: "assets/images/danhsachtuvung1.png",
                        title: "Danh sách từ vựng",
                        onTap: () {
                          router.push(const ListVocabularyRoute());
                        },
                      ),
                      ItemPractice(
                        image: "assets/images/danhsachtuvung1.png",
                        title: "Danh sách từ vựng cá nhân",
                        onTap: () {
                          router.push(const ListStudyVocabularyRoute());
                        },
                      )
                    ],
                  ),
                  ItemPractice(
                    image: "assets/images/timer1.png",
                    title: "Lịch sử học",
                    onTap: () => router.push(const HistoryRoute()),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
