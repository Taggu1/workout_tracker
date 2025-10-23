import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Features/Templates/presentation/cubit/templates_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/pages/days_page.dart';

import 'dp_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<TrackingCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<TemplatesCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Mocha.mantle,
          useMaterial3: true,
        ),
        home: DaysPage(),
      ),
    );
  }
}
