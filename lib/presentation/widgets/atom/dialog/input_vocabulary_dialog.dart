import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sakura_base/core/utils/extension/num.dart';

import '../../../../core/const/constants.dart';
import '../button/button.dart';
import '../text_view.dart';

class InputVocabularyDialog extends StatelessWidget {
  InputVocabularyDialog({
    Key? key,
    required this.title,
    this.errorMessage,
    required this.buttonText,
    this.onSavedEN,
    this.onSavedVN,
    this.labelText,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  final String buttonText;
  final String title;
  final String? labelText;
  final String? errorMessage;
  final FormFieldSetter<String>? onSavedEN;
  final FormFieldSetter<String>? onSavedVN;
  final GestureTapCallback onSubmit;
  final TextEditingController controller;

  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _focusListener();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        SystemChrome.restoreSystemUIOverlays();
      },
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 2.h),
        actionsPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        content: Container(
          height: 90.w,
          width: 100.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    title,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.blue,
                  ),
                  const SizedBox(
                    height: kDefaultWidePadding,
                  ),
                  const TextView("Từ tiếng anh:",
                      fontSize: 18, fontWeight: FontWeight.bold),

                  TextFormField(
                    onSaved: onSavedEN,
                    focusNode: _focusNode,
                    validator: (value) {
                      if (value == null) {
                        return null;
                      }
                      if (value.isEmpty) {
                        return Messages.notEmpty;
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: FontSize.huge),
                    decoration: InputDecoration(
                      labelText: labelText,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultThinPadding,
                  ),
                  const TextView("Nghĩa tiếng việt:",
                      fontSize: 18, fontWeight: FontWeight.bold),
                  TextFormField(
                    onSaved: onSavedVN,
                    validator: (value) {
                      if (value == null) {
                        return null;
                      }
                      if (value.isEmpty) {
                        return Messages.notEmpty;
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: FontSize.huge),
                    decoration: InputDecoration(
                      labelText: labelText,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultWidePadding,
                  ),
                  // if (errorMessage != null && errorMessage!.isNotEmpty)
                  //   TextError(message: errorMessage!),
                  Button(
                    buttonText,
                    color: AppColors.blue,
                    onPressed: () {
                      _focusNode.unfocus();
                      SystemChrome.restoreSystemUIOverlays();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        onSubmit();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _focusListener() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        SystemChrome.restoreSystemUIOverlays();
      }
    });
  }
}
