import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String title;
  final Color? color;
  final TextStyle? textStyle;
  final double elevation;
  final ShapeBorder? shape;
  final Function()? onPressed;

  const ResponsiveButton(
      {Key? key,
      this.width,
      this.isResponsive = false,
      this.title = "Continue",
      this.color,
      this.textStyle,
      this.elevation = 0.0,
      this.shape,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      minWidth: width,
      height: buttonHeight,
      onPressed: onPressed,
      color: color ?? Theme.of(context).buttonTheme.colorScheme?.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
