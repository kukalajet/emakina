import 'package:formz/formz.dart';
import 'package:model_repository/model_repository.dart';

enum SearchModelFieldValidationError { invalid }

class SearchModelField
    extends FormzInput<Model, SearchModelFieldValidationError> {
  const SearchModelField.pure() : super.pure(const Model(id: null, name: null));
  const SearchModelField.dirty(Model value) : super.dirty(value);

  @override
  SearchModelFieldValidationError validator(Model value) => null;
}
