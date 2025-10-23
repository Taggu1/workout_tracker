import 'package:isar/isar.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart'
    show Day, GetDayCollection, DayQueryFilter;

abstract class TemplatesRepository {
  Future<List<Day>> getTemplates();
  Future<void> saveTemplate(Day templateDay);
}

class TemplatesRepositoryImpl implements TemplatesRepository {
  final Isar database;

  TemplatesRepositoryImpl({required this.database});

  @override
  Future<void> saveTemplate(Day templateDay) async {
    await database.writeTxn(() async {
      await database.days.put(templateDay);
    });
  }

  @override
  Future<List<Day>> getTemplates() async {
    final templates =
        await database.days.where().filter().templateEqualTo(true).findAll();
    templates.sort((day1, day2) => day1.date.compareTo(day2.date));
    return templates.reversed.toList();
  }
}
