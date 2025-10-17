import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Features/tracking/data/Day.dart';
import 'package:workout_tracker/Features/tracking/data/Exercise.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';

class ExerciseTitleWidget extends StatefulWidget {
  final String? title;
  final Day day;
  final Exercise exercise;
  const ExerciseTitleWidget(
      {super.key,
      required this.title,
      required this.day,
      required this.exercise});

  @override
  State<ExerciseTitleWidget> createState() => _ExerciseTitleWidgetState();
}

class _ExerciseTitleWidgetState extends State<ExerciseTitleWidget> {
  bool isEnabled = true;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isEnabled = true;
        });
      },
      child: TextField(
        controller: _titleController,
        onTapOutside: (_) {
          setState(() {
            isEnabled = false;
          });
          context.read<TrackingCubit>().editTitle(
                widget.day,
                widget.exercise,
                _titleController.text,
              );
        },
        enabled: isEnabled,
        maxLines: null,
        cursorColor: Mocha.flamingo,
        style: TextStyle(color: Mocha.peach, fontSize: 19),
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: 'Type Exercise Name...',
          hintStyle: TextStyle(
            color: Mocha.peach.withAlpha(200),
          ),
        ),
      ),
    );
  }
}
