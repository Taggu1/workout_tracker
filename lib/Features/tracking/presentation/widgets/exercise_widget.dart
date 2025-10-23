import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/Exercise_title_widget.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/exercise_sets_widget.dart';

import '../../../../Core/theme/palette.dart';
import '../../domain/Day.dart';

class ExerciseWidget extends StatelessWidget {
  final Day day;
  final int index;
  const ExerciseWidget({
    super.key,
    required this.index,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        context.read<TrackingCubit>().removeExercise(
              day,
              day.exercises[index],
            );
      },
      child: ListTile(
        title: ExerciseTitleWidget(
          day: day,
          index: index,
        ),
        subtitle: ExerciseSetsWidget(
          dayId: day.id,
          index: index,
        ),
        trailing: index == 0
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
      ),
    );
  }
}
