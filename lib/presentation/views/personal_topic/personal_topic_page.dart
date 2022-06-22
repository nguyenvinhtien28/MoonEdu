import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/item_topic/item_topic.dart';
import '../../widgets/atom/seach_view/item_seach.dart';

class PersonalTopicPage extends HookConsumerWidget {
  const PersonalTopicPage({Key? key}) : super(key: key);

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
        child:
            ListView.builder(itemBuilder: (BuildContext context, int index) {
              return const ItemTopic(nameTopic: '', description: '', img: '',);
            }),
      ),
      bottomNavigationBar: ItemBottomNavigationOne(onTap: router.pop),
    );
  }
}
