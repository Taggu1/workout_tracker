import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_tracker/Features/Templates/data/templates_repository.dart';
import 'package:workout_tracker/Features/tracking/domain/Day.dart' show Day;

part 'templates_state.dart';

class TemplatesCubit extends Cubit<TemplatesState> {
  final TemplatesRepository _templatesRepository;
  TemplatesCubit(this._templatesRepository) : super(TemplatesState([]));

  void saveTemplate(Day templateDay) {
    _templatesRepository.saveTemplate(templateDay);
    final newTemplateDays = state.templateDays;
    newTemplateDays.add(templateDay);
    emit(TemplatesState(newTemplateDays));
  }

  void getTemplates() async {
    final templateDays = await _templatesRepository.getTemplates();
    emit(
      TemplatesState(templateDays),
    );
  }
}
