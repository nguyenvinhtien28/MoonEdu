
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/const/constants.dart';
import '../glass_morphism.dart';
import '../text_area/text_area.dart';

class GlassMorphismTextArea extends HookWidget {
  const GlassMorphismTextArea({
    Key? key,
    this.textType,
    required this.hintText,
    required this.icon,
    this.onTap,
    this.obscureText = false,
    required this.onSaved,
    this.onChange,
    this.textInputAction,
  }) : super(key: key);

  final TextType? textType;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final ValueChanged<String?> onSaved;
  final ValueChanged<String?>? onChange;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      child: TextArea(
        textInputAction: textInputAction,
        isRequired: true,
        obscureText: obscureText,
        onSaved: onSaved,
        labelText: hintText,
        onTap: onTap,
        hintText: hintText,
        onChanged: onChange,
        isGlassMorphismStyle: true,
        textLightColor: AppColors.black,
        textType: textType ?? TextType.text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultThinPadding),
          child: Icon(
            icon,
            color: AppColors.blue,
            size: 30,
          ),
        ),
      ),
    );
  }
}