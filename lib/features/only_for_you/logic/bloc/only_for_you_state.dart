import 'package:cadeau/features/only_for_you/data/models/only_for_you_model.dart';

abstract class OnlyForYouState {
  const OnlyForYouState();
}

class OnlyForYouInitial extends OnlyForYouState {}

class OnlyForYouLoading extends OnlyForYouState {}

class OnlyForYouSuccess extends OnlyForYouState {
  final OnlyForYouModel onlyForYouModel;

  const OnlyForYouSuccess({required this.onlyForYouModel});
}

class OnlyForYouFailure extends OnlyForYouState {
  final String errorModel;

  const OnlyForYouFailure({required this.errorModel});
}
