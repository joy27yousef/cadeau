import 'package:flutter_bloc/flutter_bloc.dart';

/// حالات التقييم
abstract class AddRatingState {}

class AddRatingInitial extends AddRatingState {}

class AddRatingSubmitting extends AddRatingState {}

class AddRatingSuccess extends AddRatingState {
  final String message;
  AddRatingSuccess(this.message);
}

class AddRatingError extends AddRatingState {
  final String message;
  AddRatingError(this.message);
}

/// Cubit
class AddRatingCubit extends Cubit<AddRatingState> {
  AddRatingCubit() : super(AddRatingInitial());

  /// إرسال التقييم
  Future<void> submitRating({
    required Future<String> Function() addRatingFunc,
  }) async {
    emit(AddRatingSubmitting());

    try {
      final responseMessage = await addRatingFunc();
      emit(AddRatingSuccess(responseMessage));
    } catch (e) {
      emit(AddRatingError(e.toString()));
    }
  }
}
