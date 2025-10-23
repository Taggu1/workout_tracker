import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:workout_tracker/Core/theme/palette.dart';

class DaysPageFab extends StatelessWidget {
  final VoidCallback onAddTapped;
  final VoidCallback onTemplatesTapped;
  const DaysPageFab(
      {super.key, required this.onAddTapped, required this.onTemplatesTapped});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      pos: ExpandableFabPos.left,
      distance: 60,
      openButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.menu),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Mocha.red,
        backgroundColor: Colors.transparent,
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        foregroundColor: Mocha.red,
        backgroundColor: Colors.transparent,
      ),
      children: [
        FloatingActionButton.small(
          heroTag: null,
          onPressed: onAddTapped,
          foregroundColor: Mocha.red,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton.small(
          heroTag: null,
          onPressed: onTemplatesTapped,
          foregroundColor: Mocha.red,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.new_label),
        ),
      ],
    );
  }
}
