import 'package:acm_online/feature/app/levels/data/repository/resources_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';
import '../../data/model/resources_response_model.dart';

part 'resources_state.dart';

@injectable
class ResourcesCubit extends Cubit<ResourcesState> {
  ResourcesCubit(this._repository) : super(const ResourcesState());

  final ResourcesRepository _repository;

  Future<void> getResources() async {
    emit(state.copyWith(resourcesState: Status.loading));

    final result = await _repository.getResources();

    switch (result) {
      case ApiSuccessResult<ResourcesResponseModel>():
        emit(
          state.copyWith(resourcesList: result.data, resourcesState: Status.success),
        );

      case ApiErrorResult<ResourcesResponseModel>():
        emit(
          state.copyWith(
            resourcesError: result.failures.toString(),
            resourcesState: Status.error,
          ),
        );
    }
  }
}
