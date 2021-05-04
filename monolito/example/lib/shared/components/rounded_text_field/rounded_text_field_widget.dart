import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedTextFieldWidget extends StatelessWidget {
  final Function(String?)? onSaved;
  final String Function(String?)? validator;
  final Function()? onTap;
  final Function(String?)? onChanged;
  final String? labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final Color backgroundColor;
  final Color fontColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showBorder;
  final Color? labelStyleColor;
  final String? hintText;

  RoundedTextFieldWidget({
    this.onSaved,
    this.validator,
    this.labelText,
    this.onChanged,
    this.controller,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.showBorder = true,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.backgroundColor = Colors.transparent,
    this.labelStyleColor,
    this.fontColor = Colors.black,
    this.initialValue,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        style: TextStyle(color: fontColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: showBorder ? null : InputBorder.none,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: Colors.greenAccent,
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(
            color: labelStyleColor == null
                ? Theme.of(context).accentColor
                : labelStyleColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        validator: validator,
        onTap: onTap,
        onSaved: onSaved,
        onChanged: onChanged,
      ),
    );
  }
}
