import 'package:cadeau/features/product/data/repository/product_repo.dart';
import 'package:cadeau/features/product/logic/cubit/add_rating_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRatingCubit extends Cubit<AddRatingState> {
  final reviewController = TextEditingController();
  final ratingController = TextEditingController();

  final ProductRepo repo;
  AddRatingCubit({required this.repo}) : super(AddRatingInitial());

  Future<void> submitRating({
    required int productId,
    required double rating,
    required String review,
  }) async {
    emit(AddRatingSubmitting());

    final result = await repo.addRating(productId, rating, review);

    result.fold(
      (error) => emit(AddRatingError(error.message)),
      (response) => emit(AddRatingSuccess(response.message!)),
    );
  }
}
