import 'package:flutter/material.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/set_widget.dart';

import '../../../../Core/theme/palette.dart';
import '../../data/Day.dart';
import '../../data/Exercise.dart';
import '../../data/Set.dart';

class ExerciseSetsWidget extends StatefulWidget {
  final List<ESet> sets;
  final Day day;
  final Exercise exercise;
  const ExerciseSetsWidget(
      {super.key,
      required this.sets,
      required this.day,
      required this.exercise});

  @override
  State<ExerciseSetsWidget> createState() => _ExerciseSetsWidgetState();
}

class _ExerciseSetsWidgetState extends State<ExerciseSetsWidget> {
  @override
  Widget build(BuildContext context) {
    final setsWidgets = widget.sets
        .map(
          (eSet) => WidgetSpan(
            child: SetWidget(
              day: widget.day,
              exercise: widget.exercise,
              eSet: eSet,
            ),
          ),
        )
        .toList();

    return RichText(
      text: TextSpan(
        style: TextStyle(color: Mocha.text, fontSize: 14),
        children: [
          ...setsWidgets,
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.sets.add(ESet(number: 0, weight: 0, reps: 1));
                });
              },
              child: Icon(
                Icons.add,
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
