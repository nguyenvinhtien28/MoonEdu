import 'package:flutter/material.dart';

import '../../../../core/const/constants.dart';

/// ///
/// [Button] is a button widget
/// ///
/// It can be used as follows
/// ```
/// Button (
///   "Button title",
///   onPressed: () {
///   print ("Click");
///   },
/// )
/// ```
/// ///
/// NOTE: Created based on the style guide
/// ///
class Button extends StatelessWidget {
  const Button(
      this.title, {
        Key? key,
        @required this.onPressed,
        this.onLongPress,
        this.child,
        this.padding,
        this.color,
      }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  final Widget? child;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final button = OutlinedButton(
      child: (child != null) ? child! : childText(themeData),
      style: _getButtonStyle(themeData),
      onPressed: (onPressed != null) ? onPressed : null,
      onLongPress: (onLongPress != null) ? onLongPress : null,
    );

    return button;
  }

  ButtonStyle _getButtonStyle(ThemeData themeData) {
    return OutlinedButton.styleFrom(
      backgroundColor: color ?? AppColors.blue,
      primary: AppColors.white,
      minimumSize: const Size(double.infinity, 60),
      shape: const StadiumBorder(),
      side: BorderSide(color: color ?? AppColors.blue),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
    );
  }

  Widget childText(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Text(
        title,
        style: themeData.textTheme.subtitle1!.copyWith(
          color: AppColors.white,
          fontSize: FontSize.massive,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
