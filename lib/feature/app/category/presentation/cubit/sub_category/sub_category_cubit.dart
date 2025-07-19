import 'package:acm_online/feature/app/category/domain/use_cases/sub_category_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/result.dart';
import '../../../../../../core/utils/status.dart';
import '../../../domain/entities/sub_category_entity.dart';

part 'sub_category_state.dart';

@injectable
class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit({required this.useCase}) : super(const SubCategoryState());

  SubCategoryUseCase useCase;

  Future<void> fetchSubCategory() async {
    emit(state.copyWith(subCategoryState: Status.loading));

    final result = await useCase.call();

    switch (result) {
      case ApiSuccess<List<SubCategoryEntity>>():
        emit(
          state.copyWith(
            subCategoryList: result.data,
            subCategoryState: Status.success,
          ),
        );

      case ApiError<List<SubCategoryEntity>>():
        emit(
          state.copyWith(
            subCategoryError: result.failures.toString(),
            subCategoryState: Status.error,
          ),
        );
    }
  }
}
