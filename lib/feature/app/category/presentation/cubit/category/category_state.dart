import '../../../../../../core/utils/status.dart';
import '../../../domain/entities/category_entity.dart';


class CategoryState {
  final Status categoryState;
  final String? categoryError;
  final List<CategoryEntity>? categoryList;

  const CategoryState({
    this.categoryState = Status.initial,
    this.categoryError,
    this.categoryList,
  });

  CategoryState copyWith({
    Status? categoryState,
    String? categoryError,
    List<CategoryEntity>? categoryList,
  }) {
    return CategoryState(
      categoryState: categoryState ?? this.categoryState,
      categoryError: categoryError ?? this.categoryError,
      categoryList: categoryList ?? this.categoryList,
    );
  }
}


