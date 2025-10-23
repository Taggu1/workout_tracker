import 'package:isar/isar.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart';

abstract class DaysRepository {
  Future<List<Day>> getDays();
  Future<void> saveData(List<Day> days);
}

class DaysRepositoryImpl implements DaysRepository {
  final Isar database;

  DaysRepositoryImpl({required this.database});

  @override
  Future<List<Day>> getDays() async {
    final days =
        await database.days.where().filter().templateEqualTo(false).findAll();
    days.sort((day1, day2) => day1.date.compareTo(day2.date));
    return days.reversed.toList();
  }

  @override
  Future<void> saveData(List<Day> days) async {
    await database.writeTxn(() async {
      await database.days.putAll(days);
    });
  }
}
