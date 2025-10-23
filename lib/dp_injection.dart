import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_tracker/Features/Templates/data/templates_repository.dart';
import 'package:workout_tracker/Features/Templates/presentation/cubit/templates_cubit.dart';
import 'package:workout_tracker/Features/tracking/data/days_repository.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [DaySchema],
    directory: dir.path,
  );

  sl.registerLazySingleton<DaysRepository>(
    () => DaysRepositoryImpl(
      database: isar,
    ),
  );

  sl.registerFactory(
    () => TrackingCubit(sl()),
  );

  sl.registerLazySingleton<TemplatesRepository>(
    () => TemplatesRepositoryImpl(database: isar),
  );

  sl.registerLazySingleton(
    () => TemplatesCubit(
      sl(),
    ),
  );
}
