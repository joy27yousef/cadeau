import 'package:cadeau/features/occasions/data/models/occasion_by_id_model.dart';
import 'package:cadeau/features/occasions/data/models/occasions_model.dart';

abstract class OccasionsState {}

class OccasionsInitial extends OccasionsState {}

class OccasionsLoading extends OccasionsState {}

class OccasionsSuccess extends OccasionsState {
  final OccasionsModel occasions;
  OccasionsSuccess(this.occasions);
}

class OccasionsByIdSuccess extends OccasionsState {
  final OccasionByIdModel occasions;
  OccasionsByIdSuccess(this.occasions);
}

class OccasionsError extends OccasionsState {
  final String message;
  OccasionsError(this.message);
}
