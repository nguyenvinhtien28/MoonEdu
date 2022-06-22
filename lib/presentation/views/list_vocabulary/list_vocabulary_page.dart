import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/presentation/view_models/vocabulary/vocabulary_view_model.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/item_vocabulary/item_vocabulary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/seach_view/item_seach.dart';

class ListVocabularyPage extends HookConsumerWidget {
  const ListVocabularyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final vocabularyProvider = ref.watch(vocabularyViewModel);
    useMemoized(vocabularyProvider.initPublic);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        primary: true,
        automaticallyImplyLeading: false,
        title: const ItemSearch(),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: vocabularyProvider.listVocabularyPublic.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemVocabulary(
            textEN: vocabularyProvider.listVocabularyPublic[index].english
                .toString(),
            textVN: vocabularyProvider.listVocabularyPublic[index].vietnamese
                .toString(),
            pronounce: vocabularyProvider.listVocabularyPublic[index].pronunce
                .toString(),
            onTap: () {
              vocabularyProvider.readingVocabulary(vocabularyProvider
                  .listVocabularyPublic[index].english
                  .toString());
            },
          );
        },
      )),
      bottomNavigationBar: ItemBottomNavigationOne(
        onTap: router.pop,
      ),
    );
  }
}
