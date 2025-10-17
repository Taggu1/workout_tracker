import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workout_tracker/Features/tracking/data/Exercise.dart';
import 'package:workout_tracker/Features/tracking/data/Set.dart';

import '../../data/Day.dart';

part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit()
      : super(TrackingState(
          days: [],
        ));

  void addDay() {
    // Cant add two workouts in one day (chill man)
    for (final day in state.days) {
      if (day.date.day == DateTime.now().day) return;
    }

    emit(
      state
        ..days.add(
          Day(
            date: DateTime.now(),
            exercises: [],
          ),
        ),
    );
  }

  void editTitle(Day day, Exercise exercise, String title) {
    final dayIndex = state.days.indexOf(day);

    if (dayIndex != -1) {
      final exerciseIndex = state.days[dayIndex].exercises.indexOf(exercise);

      if (exerciseIndex != -1) {
        final newState = state;

        newState.days[dayIndex].exercises[exerciseIndex] = Exercise(
          title: title,
          sets: exercise.sets,
        );
        emit(newState);
      }
    }
  }

  void editSet(
      Day day, Exercise exercise, ESet eSet, double reps, double weight) {
    final dayIndex = state.days.indexOf(day);

    if (dayIndex != -1) {
      final exerciseIndex = state.days[dayIndex].exercises.indexOf(exercise);

      if (exerciseIndex != -1) {
        final setIndex =
            state.days[dayIndex].exercises[exerciseIndex].sets.indexOf(eSet);

        if (setIndex != -1) {
          final newState = state;
          newState.days[dayIndex].exercises[exerciseIndex].sets[setIndex] =
              ESet(
            reps: reps,
            weight: weight,
            number: eSet.number,
          );

          emit(newState);
        }
      }
    }
  }
}
