import 'package:flutter/material.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Features/tracking/domain/Exercise.dart';

class TemplatesPageExerciseWidget extends StatelessWidget {
  final Exercise exercise;
  const TemplatesPageExerciseWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        exercise.title ?? "",
        style: TextStyle(
          color: Mocha.peach,
          fontSize: 20,
        ),
      ),
      trailing: Text(
        "${exercise.sets!.length} Sets",
        style: TextStyle(
          color: Mocha.teal,
          fontSize: 14,
        ),
      ),
    );
  }
}
