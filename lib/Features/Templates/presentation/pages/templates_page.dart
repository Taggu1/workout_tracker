import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/Core/utils/custom_snackbar.dart';
import 'package:workout_tracker/Core/widgets/custom_text_field.dart';
import 'package:workout_tracker/Features/Templates/presentation/cubit/templates_cubit.dart';
import 'package:workout_tracker/Features/Templates/presentation/widgets/add_template_item_sheet.dart';
import 'package:workout_tracker/Features/Templates/presentation/widgets/templates_page_exercise_widget.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart';
import 'package:workout_tracker/Features/tracking/domain/Exercise.dart';
import 'package:workout_tracker/Features/tracking/domain/Set.dart';

import '../../../../Core/theme/palette.dart';
import '../../../tracking/presentation/widgets/add_exercise_button.dart';

class TemplatesPage extends StatefulWidget {
  const TemplatesPage({super.key});

  @override
  State<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends State<TemplatesPage> {
  final List<Exercise> _templateExercises = [];
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  void onAddTappeed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Mocha.mantle,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTemplateItemSheet(
            onSaveTapped: (int setsNumber, String title) {
              setState(() {
                _templateExercises.add(
                  Exercise(
                    title: title,
                    sets: List.generate(
                      setsNumber,
                      (setNumber) => ESet(
                        number: setNumber,
                        weight: 0,
                        reps: 0,
                      ),
                    ),
                  ),
                );
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Mocha.red,
          ),
        ),
        title: CustomTextField(
          controller: _titleController,
          hintText: 'Type Day Name...',
          color: Mocha.pink,
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_titleController.text.isEmpty) {
                showCustomSnackbar(
                    context, "Cannot Create a template with no name");
                return;
              }
              context.read<TemplatesCubit>().saveTemplate(
                    Day(
                      date: DateTime.now(),
                      exercises: _templateExercises,
                      title: _titleController.text,
                      template: true,
                    ),
                  );
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.save,
              color: Mocha.green,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AddButton(
        onTap: () => onAddTappeed(
          context,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => GestureDetector(
          onLongPress: () {
            setState(() {
              _templateExercises.removeAt(index);
            });
          },
          child: TemplatesPageExerciseWidget(
            exercise: _templateExercises[index],
          ),
        ),
        itemCount: _templateExercises.length,
      ),
    );
  }
}
