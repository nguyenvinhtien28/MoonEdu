import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:flutter_sakura_base/presentation/view_models/topic/topic_view_model.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/loading/indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/atom/item_topic/item_topic.dart';

class TopicPage extends HookConsumerWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicProvider = ref.watch(topicVMProvider);
    useMemoized(topicProvider.initPublic);
    final route = useRouter();
    return Scaffold(
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
          child: topicProvider.listTopicPublic.isEmpty
              ? const Center(
                  child: Indicator(
                    color: IndicatorColor.white,
                  ),
                )
              : ListView.builder(
                  itemCount: topicProvider.listTopicPublic.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemTopic(
                      nameTopic:
                          topicProvider.listTopicPublic[index].name.toString(),
                      description: topicProvider
                          .listTopicPublic[index].description
                          .toString(),
                      img:
                          topicProvider.listTopicPublic[index].image.toString(),
                      onTap: () {
                        route.push(SelectionRoute(
                          id: topicProvider.listTopicPublic[index].id ?? 1,
                        ));
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
