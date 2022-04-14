import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../../view_models/topic/topic_view_model.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_two.dart';
import '../../widgets/atom/item_topic/item_topic.dart';
import '../../widgets/atom/loading/indicator.dart';
import '../../widgets/atom/seach_view/item_seach.dart';

class PersonalStudyTopicPage extends HookConsumerWidget {
  const PersonalStudyTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicProvider = ref.watch(topicVMProvider);
    useMemoized(topicProvider.initPrivate);
    final route = useRouter();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        primary: true,
        automaticallyImplyLeading: false,
        title: const ItemSearch(),
      ),
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bk_ga.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: topicProvider.listTopicPrivate.isEmpty
              ? const Center(
                  child: Indicator(
                    color: IndicatorColor.white,
                  ),
                )
              : ListView.builder(
                  itemCount: topicProvider.listTopicPrivate.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemTopic(
                        nameTopic: topicProvider.listTopicPrivate[index].name
                            .toString(),
                        description: topicProvider
                            .listTopicPrivate[index].description
                            .toString(),
                        img: topicProvider.listTopicPrivate[index].image
                            .toString(),
                        onTap: () {
                          route.push(SelectionRoute(
                            id: topicProvider.listTopicPrivate[index].id ?? 1,
                          ));
                        });
                  },
                ),
        ),
      ),
      bottomNavigationBar:
          ItemBottomNavigationTwo(onTap: route.pop, more: "Thêm chủ đề mới"),
    );
  }
}
