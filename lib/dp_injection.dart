import 'package:get_it/get_it.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerFactory(
    () => TrackingCubit(),
  );
}
