import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Core/widgets/custom_text_field.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';

class ExerciseTitleWidget extends StatefulWidget {
  final Day day;
  final int index;
  const ExerciseTitleWidget(
      {super.key, required this.day, required this.index});

  @override
  State<ExerciseTitleWidget> createState() => _ExerciseTitleWidgetState();
}

class _ExerciseTitleWidgetState extends State<ExerciseTitleWidget> {
  bool isEnabled = false;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingState>(
      builder: (context, state) {
        final day = state.days.firstWhere(
          (currentDay) => currentDay.id == widget.day.id,
        );
        _titleController.text = day.exercises[widget.index].title!;
        return GestureDetector(
          onDoubleTap: () {
            setState(() {
              isEnabled = true;
            });
          },
          child: CustomTextField(
            controller: _titleController,
            color: Macchiato.peach,
            onTapOutside: (_) {
              setState(() {
                isEnabled = false;
              });
              context.read<TrackingCubit>().editTitle(
                    widget.day,
                    widget.day.exercises[widget.index],
                    _titleController.text,
                  );
            },
            isEnabled: isEnabled,
          ),
        );
      },
    );
  }
}
