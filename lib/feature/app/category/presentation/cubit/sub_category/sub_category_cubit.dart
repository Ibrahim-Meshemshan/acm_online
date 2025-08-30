import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/models/result.dart';
import '../../../../../../core/utils/status.dart';
import '../../../data/models/sub_category_response_model.dart';
import '../../../data/repositories/category_repository.dart';

part 'sub_category_state.dart';

@injectable
class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit( this._categoryRepo):super(const SubCategoryState());

  final CategoryRepository _categoryRepo;

  Future<void> getSubCategory() async {
    emit(state.copyWith(subCategoryState: Status.loading));

    final result = await _categoryRepo.getSubCategory();

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
