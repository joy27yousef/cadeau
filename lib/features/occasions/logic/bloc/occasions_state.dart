import 'package:cadeau/features/occasions/data/models/occasion_by_id_model.dart';
import 'package:cadeau/features/occasions/data/models/occasions_model.dart';

abstract class OccasionsState {}

//occasions
class OccasionsInitial extends OccasionsState {}

class OccasionsLoading extends OccasionsState {}

class OccasionsSuccess extends OccasionsState {
  final OccasionsModel occasions;
  OccasionsSuccess(this.occasions);
}

class OccasionsError extends OccasionsState {
  final String message;
  OccasionsError(this.message);
}

//occasion by id

class OccasionsByIdInitial extends OccasionsState {}

class OccasionsByIdLoading extends OccasionsState {}

class OccasionsByIdSuccess extends OccasionsState {
  final OccasionByIdModel occasions;
  OccasionsByIdSuccess(this.occasions);
}

class OccasionsByIdError extends OccasionsState {
  final String message;
  OccasionsByIdError(this.message);
}
