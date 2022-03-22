import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/const/constants.dart';
import 'package:flutter_sakura_base/presentation/view_models/user/user_info_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../route/router.dart';
import '../../../widgets/atom/dialog/input_vocabulary_dialog.dart';

Future<String?> showAddVocabularyDialog(BuildContext context,String text) async {
  return showDialog(
      context: context,
      builder: (_) {
        return AddVocabularyDialog(
          text: text,
        );
      });
}

class AddVocabularyDialog extends HookConsumerWidget {
  const AddVocabularyDialog({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final userInfoProvider = ref.watch(userViewModelProvider(router));
    final textController = TextEditingController();
    useEffect(() {
      textController.text = text;
      return ;
    }, []);
    String? addEN;
    String? addVN;
    return InputVocabularyDialog(
      title: "Thêm từ mới",
      buttonText: Messages.add,
      onSavedEN: (value){
        addEN = value;
      },
      onSavedVN: (value) {
        
      },
      onSubmit: () {
        userInfoProvider.email = addEN!;
        userInfoProvider.updateEmail();
      },
      controller: textController,
    );
  }
}
