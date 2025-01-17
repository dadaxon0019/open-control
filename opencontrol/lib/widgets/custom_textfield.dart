import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final TextInputType textInputType;
  final bool isPassword;
  final TextEditingController? controller;
  final Color? bgColor;
  // final maxLine;
  // final minLine;
  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.maskTextInputFormatter,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.bgColor,
    // this.maxLine,
    // this.minLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        if (maskTextInputFormatter != null) maskTextInputFormatter!
      ],
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      // maxLines: maxLine,
      // minLines: minLine,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).hintColor,
            ),
        filled: true,
        fillColor: bgColor ?? Theme.of(context).cardColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
