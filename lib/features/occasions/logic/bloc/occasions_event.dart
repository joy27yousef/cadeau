abstract class OccasionsEvent {}

class LoadOccasions extends OccasionsEvent {}

class LoadOccasionsById extends OccasionsEvent {
  final String occasionsId;

  LoadOccasionsById(this.occasionsId);
}
