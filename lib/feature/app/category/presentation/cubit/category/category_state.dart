import '../../../../../../core/utils/status.dart';
import '../../../data/models/category_response_model.dart';


class CategoryState {
  final Status categoryState;
  final String? categoryError;
  final CategoryResponseModel? categoryList;

  const CategoryState({
    this.categoryState = Status.initial,
    this.categoryError,
    this.categoryList,
  });

  CategoryState copyWith({
    Status? categoryState,
    String? categoryError,
    CategoryResponseModel ? categoryList,
  }) {
    return CategoryState(
      categoryState: categoryState ?? this.categoryState,
      categoryError: categoryError ?? this.categoryError,
      categoryList: categoryList ?? this.categoryList,
    );
  }
}


