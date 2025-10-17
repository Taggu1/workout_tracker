import 'package:workout_tracker/Features/tracking/data/Exercise.dart';

class Day {
  final DateTime date;
  final List<Exercise> exercises;

  Day({required this.date, required this.exercises});
}
