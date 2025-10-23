import 'package:isar/isar.dart';
import 'package:workout_tracker/Features/tracking/domain/Set.dart';
import 'Exercise.dart'; // Import your Exercise class

part 'Day.g.dart'; // Make sure this line exists

@collection
class Day {
  final Id id; // Must be final for Equatable
  final DateTime date;
  final bool template;
  final String? title;
  final List<Exercise> exercises;

  // Remove 'id = Isar.autoIncrement' from here
  const Day({
    this.title,
    this.template = false,
    required this.date,
    required this.exercises,
    this.id = Isar.autoIncrement,
  });

  // Your copyWith is correct
  Day copyWith(
      {DateTime? date, List<Exercise>? exercises, Id? id, bool? template}) {
    return Day(
      date: date ?? this.date,
      exercises: exercises ?? this.exercises,
      id: id ?? this.id,
      template: template ?? this.template,
    );
  }
}
