import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Features/tracking/domain/Exercise.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';

import '../../../../Core/theme/palette.dart';
import '../../domain/Day.dart';
import '../../domain/Set.dart';

class SetWidget extends StatefulWidget {
  final String? weight;
  final String? number;
  final Day day;
  final Exercise exercise;
  final ESet eSet;
  const SetWidget(
      {super.key,
      this.weight,
      this.number,
      required this.day,
      required this.exercise,
      required this.eSet});

  static const blankStyle =
      TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.bold);

  @override
  State<SetWidget> createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  late TextEditingController _numberController;
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();

    _numberController =
        TextEditingController(text: widget.eSet.reps.toString());
    _weightController =
        TextEditingController(text: widget.eSet.weight.toString());
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: IntrinsicWidth(
            child:
                _buildBlankField(_weightController, 'w ', SetWidget.blankStyle),
          ),
        ),
        TextSpan(text: 'KG '),
        // This is the second blank
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: IntrinsicWidth(
            child:
                _buildBlankField(_numberController, 'n ', SetWidget.blankStyle),
          ),
        ),
        const TextSpan(text: ', '),
      ],
    ));
  }

  TextField _buildBlankField(
      TextEditingController controller, String hint, TextStyle style) {
    return TextField(
      controller: controller,
      onTapOutside: (_) {
        context.read<TrackingCubit>().editSet(
              widget.day,
              widget.exercise,
              widget.eSet,
              double.parse(_numberController.text),
              double.parse(
                _weightController.text,
              ),
            );
      },
      cursorColor: Mocha.text,
      style: TextStyle(color: Mocha.text, fontSize: 14),
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: hint,
        hintStyle: TextStyle(
          color: Mocha.text.withAlpha(200),
        ),
      ),
    );
  }
}
