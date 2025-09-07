part of 'resources_cubit.dart';

class ResourcesState {
  final Status resourcesState;
  final String? resourcesError;
  final ResourcesResponseModel? resourcesList;
  final String? resultError;
  final ResultsResponseModel? resultModel;

  const ResourcesState({
    this.resourcesState = Status.initial,
    this.resourcesError,
    this.resourcesList,
    this.resultError,
    this.resultModel,
  });

  ResourcesState copyWith({
    Status? resourcesState,
    String? resourcesError,
    ResourcesResponseModel? resourcesList,
    String? resultError,
    ResultsResponseModel? resultModel,
  }) {
    return ResourcesState(
      resourcesState: resourcesState ?? this.resourcesState,
      resourcesError: resourcesError ?? this.resourcesError,
      resourcesList: resourcesList ?? this.resourcesList,
      resultError: resultError ?? this.resultError,
      resultModel: resultModel ?? this.resultModel,
    );
  }
}
