import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final Color? iconColor;

  final Color backroundColor;
  final Color? fillColor;
  final double? width;
  final double radius;
  final double? height;
  final IconData? icon;
  final double iconSize;
  final double fontSize;
  final String hintText;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double? borderWidth;
  final IconData? suffixIcon;
  final TextInputType? inputType;
  final String obscuringCharacter;
  final GestureTapCallback? suffixClick;
  final GestureTapCallback? prefixClick;
  final TextEditingController? controller;
  final VoidCallback? ontap;

  const RoundedInputField({
    Key? key,
    required this.backroundColor,
    this.icon,
    this.onSaved,
    this.iconColor,
    this.width,
    this.height,
    required this.radius,
    this.inputType,
    this.controller,
    this.suffixIcon,
    this.borderWidth,
    this.fontSize = 16,
    this.iconSize = 20,
    required this.hintText,
    this.obscureText = false,
    this.suffixClick,
    this.prefixClick,
    this.obscuringCharacter = "*",
    this.validator,
    this.fillColor,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: backroundColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          onTap: ontap,
          autofocus: false,
          validator: validator,
          onSaved: onSaved,
          obscuringCharacter: "*",
          controller: controller,
          keyboardType: inputType,
          textAlign: TextAlign.left,
          obscureText: obscureText,
          style: TextStyle(fontFamily: 'secondaryFont', fontSize: fontSize),
          decoration: InputDecoration(
            icon: GestureDetector(
                onTap: prefixClick,
                child: Icon(icon, size: iconSize, color: iconColor)),
            suffixIcon: GestureDetector(
              onTap: suffixClick,
              child: Icon(
                suffixIcon,
                color: iconColor,
                size: iconSize,
              ),
            ),
            fillColor: iconColor,
            hintText: hintText,
            hintStyle:
                TextStyle(fontFamily: 'secondaryFont', fontSize: fontSize),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
