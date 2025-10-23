import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:workout_tracker/Features/Templates/presentation/cubit/templates_cubit.dart';
import 'package:workout_tracker/Features/Templates/presentation/pages/templates_page.dart';
import 'package:workout_tracker/Features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/day_widget.dart';
import 'package:workout_tracker/Features/tracking/presentation/widgets/days_page_fab.dart';

class DaysPage extends StatefulWidget {
  const DaysPage({super.key});

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  @override
  void initState() {
    super.initState();
    context.read<TrackingCubit>().getDaya();
    context.read<TemplatesCubit>().getTemplates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: DaysPageFab(
        onAddTapped: () {
          context.read<TrackingCubit>().addDay();
        },
        onTemplatesTapped: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => TemplatesPage(),
          ));
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
                    (eDay) => DayWidget(
                      day: eDay,
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
