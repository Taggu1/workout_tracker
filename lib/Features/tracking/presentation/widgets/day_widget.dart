import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_tracker/Core/theme/palette.dart';
import 'package:workout_tracker/Features/tracking/presentation/pages/day_page.dart';

import '../../domain/Day.dart';

class DayWidget extends StatelessWidget {
  final Day day;
  const DayWidget({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => DayPage(
            dayId: day.id,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Mocha.surface0,
        ),
        child: Center(
          child: Hero(
            tag: day.date.toIso8601String(),
            child: Material(
              color: Colors.transparent,
              child: Text(
                DateFormat('d MMM').format(day.date),
                style: TextStyle(
                  fontSize: 20,
                  color: Mocha.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
