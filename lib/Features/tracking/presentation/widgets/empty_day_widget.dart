import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';

class EmptyDayWidget extends StatelessWidget {
  final List<Day> templates;
  final Day day;
  const EmptyDayWidget({super.key, required this.templates, required this.day});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color.fromRGBO(49, 50, 68, 1),
          ),
          child: Column(
            children: [
              Text(
                "Choose From A Template",
                style: TextStyle(fontSize: 17, color: Mocha.teal),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    context.read<TrackingCubit>().editDayFromTemplate(
                          day,
                          templates[index],
                        );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Mocha.surface0,
                    ),
                    child: Text(
                      templates[index].title ?? "No-title",
                      style: TextStyle(
                        color: Mocha.pink,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                itemCount: templates.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
