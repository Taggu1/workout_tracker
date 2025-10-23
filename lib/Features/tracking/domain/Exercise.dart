import 'package:isar/isar.dart';
import 'Set.dart'; // Import your ESet class

part 'Exercise.g.dart'; // Make sure this line exists

@embedded
class Exercise {
  final String? title;
  final List<ESet>? sets;

  // MUST be a const constructor
  const Exercise({this.title, this.sets});

  // Default constructor for Isar
  const Exercise.empty()
      : title = '',
        sets = const [];

  Exercise copyWith({List<ESet>? sets}) {
    return Exercise(
      title: title,
      sets: sets ?? this.sets,
    );
  }
}
