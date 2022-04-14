import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';
import 'package:flutter_sakura_base/presentation/view_models/history/history_view_model.dart';
import 'package:flutter_sakura_base/presentation/views/history/modecule/item_history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../../widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import '../../widgets/atom/loading/indicator.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyProvider = ref.watch(historyViewModelProvider);
    final router = useRouter();
    useMemoized(historyProvider.init);

    return Scaffold(
      body: SafeArea(
        child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bk_ga.jpg'),
                    fit: BoxFit.fill)),
            child: historyProvider.list.isEmpty
                ? const Center(
                    child: Indicator(
                      color: IndicatorColor.white,
                    ),
                  )
                : ListView.builder(
                    itemCount: historyProvider.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemHistory(
                        text:
                            historyProvider.list[index].description ?? " Null",
                        title: historyProvider.list[index].topic?.name ?? "",
                        timeAt: historyProvider.list[index].createdAt ?? "null",
                      );
                    },
                  )),
      ),
      bottomNavigationBar: ItemBottomNavigationOne(onTap: router.pop),
    );
  }
}
