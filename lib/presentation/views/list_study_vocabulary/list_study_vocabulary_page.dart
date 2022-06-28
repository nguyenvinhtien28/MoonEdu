import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/presentation/views/list_study_vocabulary/organism/add_vocablary.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_two.dart';
import '../../widgets/atom/item_vocabulary/item_vocabulary.dart';
import '../../widgets/atom/seach_view/item_seach.dart';

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
        child: ListView(
          children: [
            Slidable(
              key: const ValueKey(1),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Sửa',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Xoá',
                  ),
                ],
              ),
              child: const ItemVocabulary(
                textEN: "textEN",
                textVN: "textVN",
                pronounce: '',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ItemBottomNavigationTwo(
        onTap: router.pop,
        more: 'Thêm tự vựng mới',
        onMoreTap: () {
          showAddVocabularyDialog(context, "Thêm từ mới");
        },
      ),
    );
  }
}

void doNothing(BuildContext context) {}
