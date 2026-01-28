import 'package:cadeau/features/search/data/models/search_product_model.dart';
import 'package:cadeau/features/search/data/repository/searchProduct_repo.dart';
import 'package:cadeau/features/search/logic/bloc/search_event.dart';
import 'package:cadeau/features/search/logic/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchproductRepo repo;

  SearchProductModel? cached;

  SearchBloc({required this.repo}) : super(SearchInitial()) {
    on<FilterProducts>(submitFilters);
  }
  Future<void> submitFilters(
    FilterProducts event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    final result = await repo.getFilteredProducts(
      categoryId: event.categoryId,
      brandId: event.brandId,
      priceFrom: event.minPrice != null
          ? double.tryParse(event.minPrice!)
          : null,
      priceTo: event.maxPrice != null ? double.tryParse(event.maxPrice!) : null,
      searchQuery: event.name,
    );

    result.fold((error) => emit(SearchError(error.message)), (model) {
      cached = model;
      emit(SearchSuccess(model));
    });
  }
}
