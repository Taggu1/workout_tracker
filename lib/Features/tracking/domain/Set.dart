import 'package:isar/isar.dart';

part 'Set.g.dart'; // Make sure this line exists

@embedded
class ESet {
  final double? reps;
  final int? number;
  final double? weight;

  // MUST be a const constructor
  const ESet({this.reps, this.weight, this.number});

  // Default constructor for Isar
  const ESet.empty()
      : reps = 0,
        number = 0,
        weight = 0;
}
