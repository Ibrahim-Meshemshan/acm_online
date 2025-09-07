import '../../../../../../core/utils/status.dart';
import '../../../data/models/category_response_model.dart';
import '../../../data/models/sub_category_response_model.dart';


class CategoryState {
  final Status categoryState;
  final Status subCategoryState;
  final String? categoryError;
  final String? subCategoryError;
  final CategoryResponseModel? categoryList;
  final SubCategoryResponseModel? subCategoryList;

  const CategoryState({
    this.categoryState = Status.initial,
    this.subCategoryState = Status.initial,
    this.categoryError,
    this.subCategoryError,
    this.categoryList,
    this.subCategoryList
  });

  CategoryState copyWith({
    Status? categoryState,
    Status? subCategoryState,
    String? categoryError,
    String? subCategoryError,
    CategoryResponseModel? categoryList,
    SubCategoryResponseModel? subCategoryList,
  }) {
    return CategoryState(
      categoryState: categoryState ?? this.categoryState,
      subCategoryState: subCategoryState ?? this.subCategoryState,
      categoryError: categoryError ?? this.categoryError,
      subCategoryError: subCategoryError ?? this.subCategoryError,
      categoryList: categoryList ?? this.categoryList,
      subCategoryList: subCategoryList ?? this.subCategoryList,
    );
  }
}


