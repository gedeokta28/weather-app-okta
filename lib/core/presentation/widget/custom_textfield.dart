import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final FocusNode? focusNode;
  final String? hintText;
  final bool isSecure;
  final bool isError;
  final TextEditingController controller;
  final FormFieldValidator? fieldValidator;
  final TextInputType inputType;
  final bool refresh;
  final bool autofocus;
  final Function? onTap;
  final String? suffixText;
  final bool border;
  final Function(String value)? onChanged;
  final bool enabled;
  final int? maxLine;
  final VoidCallback? togglePasswordVisibility;
  final bool passwordVisibility;
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.hintText = '',
    this.focusNode,
    this.isSecure = false,
    this.isError = false,
    required this.controller,
    required this.fieldValidator,
    this.inputType = TextInputType.text,
    this.refresh = false,
    this.autofocus = false,
    this.onTap,
    this.suffixText,
    this.border = false,
    this.onChanged,
    this.enabled = true,
    this.maxLine,
    this.togglePasswordVisibility,
    this.passwordVisibility = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = widget.isSecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.togglePasswordVisibility != null) {
      _passwordVisible = widget.passwordVisibility;
    }
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: _passwordVisible,
      validator: widget.fieldValidator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: widget.isSecure
            ? Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: 20.0,
                  onPressed: () {
                    if (widget.togglePasswordVisibility != null) {
                      widget.togglePasswordVisibility!();
                    } else {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }
                  },
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 24,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
