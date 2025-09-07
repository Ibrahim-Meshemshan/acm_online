import 'package:acm_online/feature/app/category/data/models/category_response_model.dart';
import 'package:acm_online/feature/app/category/data/repositories/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/result.dart';
import '../../../../../../core/utils/status.dart';
import '../../../data/models/sub_category_response_model.dart';
import 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
 final CategoryRepository _categoryRepository;

  CategoryCubit(this._categoryRepository) : super(const CategoryState());

  Future<void> fetchCategory() async {
    emit(state.copyWith(categoryState: Status.loading));

    final result = await _categoryRepository.getCategories();

    switch (result) {
      case ApiSuccessResult<CategoryResponseModel>():
        emit(
          state.copyWith(
            categoryList: result.data,
            categoryState: Status.success,
          ),
        );

      case ApiErrorResult<CategoryResponseModel>():
        emit(
          state.copyWith(
            categoryError: result.failures.toString(),
            categoryState: Status.error,
          ),
        );
    }
  }

  Future<void> fetchSubCategory(int subCategoryId) async {
    emit(state.copyWith(subCategoryState: Status.loading));

    final result = await _categoryRepository.getSubCategory(subCategoryId);

    switch (result) {
      case ApiSuccessResult<SubCategoryResponseModel>():
        emit(
          state.copyWith(
            subCategoryList: result.data,
            subCategoryState: Status.success,
          ),
        );

      case ApiErrorResult<SubCategoryResponseModel>():
        emit(
          state.copyWith(
            subCategoryError: result.failures.toString(),
            subCategoryState: Status.error,
          ),
        );
    }
  }
}
