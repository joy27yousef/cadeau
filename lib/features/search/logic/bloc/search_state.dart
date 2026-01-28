import 'package:cadeau/features/search/data/models/search_product_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchProductModel product;
  SearchSuccess(this.product);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
