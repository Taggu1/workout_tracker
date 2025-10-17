import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Features/tracking/data/Day.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/add_exercise_button.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/day_widget.dart';

class DaysPage extends StatefulWidget {
  const DaysPage({super.key});

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AddButton(
        onTap: () {
          context.read<TrackingCubit>().addDay();
        },
      ),
      body: BlocBuilder<TrackingCubit, TrackingState>(
        builder: (BuildContext context, TrackingState state) {
          return Padding(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: GridView.extent(
              maxCrossAxisExtent: 120,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              children: state.days
                  .map(
                    (day) => DayWidget(
                      day: day,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
