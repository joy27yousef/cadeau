import 'package:cadeau/features/categories/data/model/categories_model.dart';
import 'package:cadeau/features/categories/data/model/category_by_id_model.dart';

abstract class CategoriesState {}

//category
class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final CategoriesModel categories;
  CategoriesSuccess(this.categories);
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}

//categories by id
class CategoryByIdSuccess extends CategoriesState {
  final CategoryByIdModel categories;
  CategoryByIdSuccess(this.categories);
}

class CategoriesByIdInitial extends CategoriesState {}

class CategoriesByIdLoading extends CategoriesState {}

class CategoriesByIdError extends CategoriesState {
  final String message;
  CategoriesByIdError(this.message);
}
