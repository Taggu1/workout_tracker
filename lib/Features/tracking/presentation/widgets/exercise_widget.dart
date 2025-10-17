import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_tracker/Features/tracking/data/Exercise.dart';
import 'package:workout_tracker/Features/tracking/data/Set.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/Exercise_title_widget.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/exercise_sets_widget.dart';

import '../../../../Core/theme/palette.dart';
import '../../data/Day.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;
  final bool isFirst;
  final Day day;
  const ExerciseWidget(
      {super.key,
      required this.exercise,
      required this.isFirst,
      required this.day});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ExerciseTitleWidget(
        title: exercise.title,
        day: day,
        exercise: exercise,
      ),
      subtitle: ExerciseSetsWidget(
        sets: exercise.sets,
        day: day,
        exercise: exercise,
      ),
      trailing: isFirst
          ? Padding(
              padding: EdgeInsets.only(left: 15),
              child: Hero(
                tag: day.date.toIso8601String(),
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    DateFormat('d MMM').format(day.date),
                    style: TextStyle(
                      fontSize: 20,
                      color: Mocha.teal,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
