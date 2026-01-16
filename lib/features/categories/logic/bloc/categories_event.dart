part of 'categories_bloc.dart';

abstract class CategoriesEvent {}

class LoadCategories extends CategoriesEvent {}

class LoadCategoryById extends CategoriesEvent {
  final String categoryId;

  LoadCategoryById(this.categoryId);
}
