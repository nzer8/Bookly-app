import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    this.topLeft = 0,
    this.bottomLeft = 0,
    this.topRight = 0,
    this.bottomRight = 0,
    required this.title,
    required this.textColor,
    this.horizontalPadding = 45,
    this.verticalPadding = 12,
    required this.style,
   });

  final void Function()? onPressed;
  final Color backgroundColor;
  final double topLeft;
  final double bottomLeft;
  final double topRight;
  final double bottomRight;
  final String title;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final TextStyle style;
   @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            topRight: Radius.circular(topRight),
            bottomRight: Radius.circular(bottomRight),
          ),
        ),
      ),
      child: Text(
        title,
        style: style.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
