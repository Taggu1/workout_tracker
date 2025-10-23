import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/set_widget.dart';

import '../../../../Core/theme/palette.dart';

class ExerciseSetsWidget extends StatelessWidget {
  final Id dayId;
  final int index;
  const ExerciseSetsWidget(
      {super.key, required this.dayId, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingState>(
      builder: (context, state) {
        final day = state.days.firstWhere(
          (currentDay) => currentDay.id == dayId,
        );

        final setsWidgets = day.exercises[index].sets!
            .map(
              (eSet) => WidgetSpan(
                child: SetWidget(
                  day: day,
                  exercise: day.exercises[index],
                  eSet: eSet,
                ),
              ),
            )
            .toList();
        return RichText(
          text: TextSpan(
            style: TextStyle(color: Mocha.text, fontSize: 14),
            children: [
              ...setsWidgets,
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<TrackingCubit>()
                        .addSet(day, day.exercises[index]);
                  },
                  child: Icon(
                    Icons.add,
                    size: 19,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
