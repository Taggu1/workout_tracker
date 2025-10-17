import 'package:flutter/material.dart';

import '../../../../Core/theme/palette.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: onTap,
      child: Icon(
        Icons.add,
        color: Mocha.red,
      ),
    );
  }
}
