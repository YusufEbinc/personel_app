import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/responsive.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
    this.buttonTextFont,
    this.height,
    this.buttonTextFontSize = 16,
    this.width,
    required this.buttonColor,
    this.buttonTextColor,
    required this.radius,
  }) : super(key: key);

  final String text;
  final double? width;
  final VoidCallback? press;
  final Color buttonColor;
  final double? height;
  final double buttonTextFontSize;
  final double radius;
  final String? buttonTextFont;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle:
              TextStyle(color: buttonTextColor, fontSize: buttonTextFontSize),
        ),
      ),
    );
  }
}
