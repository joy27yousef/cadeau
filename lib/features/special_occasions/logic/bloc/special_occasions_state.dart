import 'package:cadeau/features/special_occasions/data/models/special_occasions_model.dart';

abstract class SpecialOccasionsState {}

//Special occasions

class SpecialOccasionsInitial extends SpecialOccasionsState {}

class SpecialOccasionsLoading extends SpecialOccasionsState {}

class SpecialOccasionsByIdSuccess extends SpecialOccasionsState {
  final SpecialOccasionsModel occasions;
  SpecialOccasionsByIdSuccess(this.occasions);
}

class SpecialOccasionsError extends SpecialOccasionsState {
  final String message;
  SpecialOccasionsError(this.message);
}


