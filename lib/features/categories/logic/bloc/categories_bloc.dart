import 'package:cadeau/features/categories/data/model/categories_model.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cadeau/features/categories/data/repository/categories_repo.dart';

part 'categories_event.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepo repo;

  CategoriesModel? cachedCategories;

  CategoriesBloc({required this.repo}) : super(CategoriesInitial()) {
    on<LoadCategories>(loadCategories);
    on<LoadCategoryById>(loadCategoryById);
  }

  Future<void> loadCategories(
    LoadCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    try {
      final categories = await repo.getCategories();
      cachedCategories = categories;
      emit(CategoriesSuccess(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> loadCategoryById(
    LoadCategoryById event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    try {
      final category = await repo.getCategoryById(event.categoryId);
      emit(CategoryByIdSuccess(category));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
