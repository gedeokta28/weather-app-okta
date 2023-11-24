import 'package:flutter/material.dart';
import 'package:weather_app_okta/core/static/colors.dart';

class AppButton extends StatefulWidget {
  final Widget text;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final double borderSide;
  final Color borderSideColor;
  final Color? shadowColor;
  final void Function()? onPressed;
  const AppButton({
    Key? key,
    this.text = const Text(''),
    this.elevation,
    this.textColor = whiteColor,
    this.backgroundColor = primaryColor,
    this.cornerRadius = 5.0,
    this.borderSide = 0,
    this.borderSideColor = accentColor,
    this.shadowColor,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 30,
    ),
    this.onPressed,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: widget.textColor,
        backgroundColor: widget.backgroundColor,
        textStyle: const TextStyle(fontSize: 20, color: whiteColor),
        minimumSize: const Size.fromHeight(50),
        shadowColor: widget.shadowColor,
        padding: widget.padding,
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          side: BorderSide(
            width: widget.borderSide,
            color: widget.borderSideColor,
          ),
        ),
      ),
      child: widget.text,
    );
  }
}
