import 'package:flutter/material.dart';
import 'package:workout_tracker/Core/theme/palette.dart';

class SelectSetsNumButton extends StatelessWidget {
  final int value;
  final void Function(int?)? onChanged;
  const SelectSetsNumButton({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: value,
      itemHeight: 50,
      dropdownColor: Mocha.mantle,
      iconEnabledColor: Mocha.text,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      alignment: AlignmentGeometry.center,
      elevation: 0,
      hint: const Text('Select an option'),
      isExpanded: true,
      style: TextStyle(
        color: Mocha.text,
      ),
      borderRadius: BorderRadius.circular(22),
      underline: Container(),
      items: [
        DropdownMenuItem(
          value: 1,
          child: Text(
            "1 Sets",
          ),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text(
            "2 Sets",
          ),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text(
            "3 Sets",
          ),
        ),
        DropdownMenuItem(
          value: 4,
          child: Text(
            "4 Sets",
          ),
        ),
      ],
      // 4. Handle the change event
      onChanged: onChanged,
    );
  }
}
