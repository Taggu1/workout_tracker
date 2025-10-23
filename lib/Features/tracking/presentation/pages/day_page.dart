import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:workout_tracker/Core/widgets/custom_app_bar.dart';
import 'package:workout_tracker/Features/Templates/presentation/cubit/templates_cubit.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/add_exercise_button.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/empty_day_widget.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/exercise_widget.dart';

class DayPage extends StatefulWidget {
  final Id dayId;
  const DayPage({super.key, required this.dayId});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  late List<Day> _templates;

  @override
  void initState() {
    super.initState();
    _templates = context.read<TemplatesCubit>().state.templateDays;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingState>(
      builder: (context, state) {
        final day = state.days
            .firstWhere((selectedDay) => selectedDay.id == widget.dayId);

        return Scaffold(
          appBar: CustomAppBar(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: AddButton(onTap: () {
            context.read<TrackingCubit>().addExercise(
                  day,
                  "",
                );
          }),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: day.exercises.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) => ExerciseWidget(
                      day: day,
                      index: index,
                    ),
                    itemCount: day.exercises.length,
                  )
                : EmptyDayWidget(
                    templates: _templates,
                    day: day,
                  ),
          ),
        );
      },
    );
  }
}
