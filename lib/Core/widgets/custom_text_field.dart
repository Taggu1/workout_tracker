import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool? isEnabled;
  final Color color;
  final int? maxLength;
  final double? fontSize;
  final String? hintText;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.onTapOutside,
      this.isEnabled,
      required this.color,
      this.fontSize,
      this.maxLength,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: onTapOutside,
      enabled: isEnabled,
      maxLines: null,
      maxLength: maxLength,
      cursorColor: color,
      style: TextStyle(color: color, fontSize: fontSize ?? 19),
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: hintText ?? 'Type Workout Name...',
        hintStyle: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
