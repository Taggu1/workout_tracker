import 'package:flutter/material.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Features/tracking/data/Day.dart';
import 'package:workout_tracker/Features/tracking/data/Exercise.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/add_exercise_button.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/exercise_widget.dart';
import 'package:intl/intl.dart';

import '../../data/Set.dart';

class DayPage extends StatefulWidget {
  final Day day;
  const DayPage({super.key, required this.day});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  late List<Exercise> exercises = [];

  @override
  void initState() {
    super.initState();

    exercises = widget.day.exercises;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AddButton(onTap: () {
        setState(() {
          exercises.add(Exercise(title: null, sets: []));
        });
      }),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemBuilder: (context, index) => ExerciseWidget(
            exercise: exercises[index],
            isFirst: index == 0,
            day: widget.day,
          ),
          itemCount: exercises.length,
        ),
      ),
    );
  }
}
