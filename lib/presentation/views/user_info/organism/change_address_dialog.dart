import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/core/const/constants.dart';
import 'package:flutter_sakura_base/presentation/view_models/user/user_info_view_model.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/dialog/input_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/atom/snackbar/snackbar.dart';

Future<String?> showChangeAddressDialog(
    BuildContext context, String text) async {
  return showDialog(
      context: context,
      builder: (_) {
        return ChangeAddressDialog(
          text: text,
        );
      });
}

class ChangeAddressDialog extends HookConsumerWidget {
  const ChangeAddressDialog({
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
      return textController.dispose;
    }, []);
    String? address;

    return InputDialog(
      title: Messages.address,
      buttonText: Messages.change,
      onSaved: (value) {
        address = value;
      },
      onSubmit: () {
        userInfoProvider.address = address!;
        showSnackBarCustom(
          context,
          message: Messages.successful,
          icon: Icons.done,
        );
        userInfoProvider.updateAddress();
      },
      controller: textController,
    );
  }
}
