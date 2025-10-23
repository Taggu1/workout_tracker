import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_tracker/Core/theme/palette.dart';

void showCustomSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Mocha.text),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Mocha.surface0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(
          12,
        ),
      ),
    ),
  );
}
