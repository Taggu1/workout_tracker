import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workout_tracker/Features/tracking/data/days_repository.dart';
import 'package:workout_tracker/Features/tracking/domain/Exercise.dart';
import 'package:workout_tracker/Features/tracking/domain/Set.dart';

import '../../domain/Day.dart';

part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  final DaysRepository daysRepository;
  TrackingCubit(this.daysRepository)
      : super(TrackingState(
          days: [],
        ));

  void getDaya() async {
    final days = await daysRepository.getDays();

    emit(
      TrackingState(
        days: days,
      ),
    );
  }

  void editDayFromTemplate(Day day, Day template) async {
    final dayIndex = state.days.indexOf(day);
    final newDays = state.days;
    newDays[dayIndex] = template.copyWith(
      id: day.id,
      date: DateTime.now(),
      template: false,
    );

    emit(TrackingState(days: newDays));

    await daysRepository.saveData(state.days);
  }

  void addSet(Day day, Exercise exercise) async {
    final dayIndex = state.days.indexOf(day);

    if (dayIndex != -1) {
      final exerciseIndex = state.days[dayIndex].exercises.indexOf(exercise);

      if (exerciseIndex != -1) {
        final newDays = state.days;
        newDays[dayIndex].exercises[exerciseIndex] =
            newDays[dayIndex].exercises[exerciseIndex].copyWith(sets: [
          ...exercise.sets!,
          ESet(number: exercise.sets!.length, reps: 0, weight: 0),
        ]);

        emit(TrackingState(days: newDays));
      }
    }
    await daysRepository.saveData(state.days);
  }

  void addExercise(Day day, String title) async {
    final dayIndex = state.days.indexOf(day);

    if (dayIndex != -1) {
      final newDays = state.days;

      newDays[dayIndex] = newDays[dayIndex].copyWith(exercises: [
        ...newDays[dayIndex].exercises,
        Exercise(title: "", sets: [])
      ]);
      emit(TrackingState(days: newDays));
      await daysRepository.saveData(state.days);
    }
  }

  void addDay() async {
    // Cant add two workouts in one day (chill man)
    for (final day in state.days) {
      if (day.date.day == DateTime.now().day) return;
    }

    final newDays = state.days
      ..add(
        Day(
          date: DateTime.now(),
          exercises: [],
        ),
      );

    emit(TrackingState(days: newDays));
    await daysRepository.saveData(state.days);
  }

  void editTitle(Day day, Exercise exercise, String title) async {
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
    await daysRepository.saveData(state.days);
  }

  void removeExercise(Day day, Exercise exercise) async {
    final dayIndex = state.days.indexOf(day);

    if (dayIndex != -1) {
      final exerciseIndex = state.days[dayIndex].exercises.indexOf(exercise);

      if (exerciseIndex != -1) {
        final newDays = state.days;
        final newExerises = newDays[dayIndex].exercises.toList();
        newExerises.removeAt(exerciseIndex);
        newDays[dayIndex] = newDays[dayIndex].copyWith(exercises: newExerises);
        emit(TrackingState(days: newDays));
      }
    }
    await daysRepository.saveData(state.days);
  }

  void editSet(
      Day day, Exercise exercise, ESet eSet, double reps, double weight) async {
    final dayIndex = state.days.indexOf(day);

    if (dayIndex != -1) {
      final exerciseIndex = state.days[dayIndex].exercises.indexOf(exercise);

      if (exerciseIndex != -1) {
        final setIndex =
            state.days[dayIndex].exercises[exerciseIndex].sets!.indexOf(eSet);
        if (setIndex != -1) {
          final newState = state;
          newState.days[dayIndex].exercises[exerciseIndex].sets![setIndex] =
              ESet(
            reps: reps,
            weight: weight,
            number: eSet.number,
          );

          emit(newState);
        }
      }
    }
    await daysRepository.saveData(state.days);
  }
}
