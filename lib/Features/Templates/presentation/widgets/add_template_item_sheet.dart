import 'package:flutter/material.dart';
import 'package:workout_tracker/Core/theme/palette.dart' show Mocha;
import 'package:workout_tracker/Features/Templates/presentation/widgets/select_sets_num_button.dart'
    show SelectSetsNumButton;

import '../../../../Core/widgets/custom_text_field.dart';

class AddTemplateItemSheet extends StatefulWidget {
  final void Function(int setsNumber, String title) onSaveTapped;
  const AddTemplateItemSheet({super.key, required this.onSaveTapped});

  @override
  State<AddTemplateItemSheet> createState() => _AddTemplateItemSheetState();
}

class _AddTemplateItemSheetState extends State<AddTemplateItemSheet> {
  int _setsNum = 1;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _titleController,
            color: const Color.fromRGBO(242, 205, 205, 1),
            maxLength: 100,
          ),
          SizedBox(
            height: 20,
          ),
          SelectSetsNumButton(
            value: _setsNum,
            onChanged: (value) {
              setState(() {
                _setsNum = value ?? 1;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => widget.onSaveTapped(
              _setsNum,
              _titleController.text,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Mocha.base,
                borderRadius: BorderRadius.circular(22),
              ),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(color: Mocha.teal),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
