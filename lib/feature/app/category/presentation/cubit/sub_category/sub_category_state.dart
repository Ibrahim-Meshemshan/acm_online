part of 'sub_category_cubit.dart';

class SubCategoryState {
  final Status subCategoryState;
  final String? subCategoryError;
  final List<SubCategoryEntity>? subCategoryList;

  const SubCategoryState({
    this.subCategoryState = Status.initial,
    this.subCategoryError,
    this.subCategoryList,
  });

  SubCategoryState copyWith({
    Status? subCategoryState,
    String? subCategoryError,
    List<SubCategoryEntity>? subCategoryList,
  }) {
    return SubCategoryState(
      subCategoryState: subCategoryState ?? this.subCategoryState,
      subCategoryError: subCategoryError ?? this.subCategoryError,
      subCategoryList: subCategoryList ?? this.subCategoryList,
    );
  }
}



