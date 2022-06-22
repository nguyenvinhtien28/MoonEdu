import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/const/constants.dart';
import 'package:flutter_sakura_base/presentation/view_models/user/user_info_view_model.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/dialog/input_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/atom/snackbar/snackbar.dart';

Future<String?> showChangeNameDialog(
    BuildContext context, String text) async {
  return showDialog(
      context: context,
      builder: (_) {
        return ChangeNameDialog(
          text: text,
        );
      });
}

class ChangeNameDialog extends HookConsumerWidget {
  const ChangeNameDialog({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoProvider = ref.watch(userViewModelProvider);
    final textController = TextEditingController();
    useEffect(() {
      textController.text = text;
      return;
    }, []);
    String? name;
    return InputDialog(
      title: Messages.name,
      buttonText: Messages.change,
      onSaved: (value) {
        name = value;
      },
      onSubmit: () {
        userInfoProvider.name = name!;
        showSnackBarCustom(
          context,
          message: Messages.successful,
          icon: Icons.done,
        );
        userInfoProvider.updateName();
      },
      controller: textController,
    );
  }
}
