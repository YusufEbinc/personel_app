import 'package:flutter/material.dart';

import '../../extension/responsive.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
    this.buttonTextFont,
    this.buttonHeight,
    this.buttonFontSize = 16,
    this.buttonWidth,
    required this.buttonColor,
    this.buttonTextColor,
    required this.radius,
  }) : super(key: key);

  final String text;
  final double? buttonWidth;
  final VoidCallback? press;
  final Color buttonColor;
  final double? buttonHeight;
  final double buttonFontSize;
  final double radius;
  final String? buttonTextFont;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          textStyle:
              TextStyle(color: buttonTextColor, fontSize: buttonFontSize),
        ),
      ),
    );
  }
}
