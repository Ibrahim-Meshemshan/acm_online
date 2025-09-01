part of 'resources_cubit.dart';

 class ResourcesState {
   final Status resourcesState;
   final String? resourcesError;
   final ResourcesResponseModel ? resourcesList;

   const ResourcesState({
     this.resourcesState = Status.initial,
     this.resourcesError,
     this.resourcesList,
   });

   ResourcesState copyWith({
     Status? resourcesState,
     String? resourcesError,
     ResourcesResponseModel? resourcesList,
   }) {
     return ResourcesState(
       resourcesState: resourcesState ?? this.resourcesState,
       resourcesError: resourcesError ?? this.resourcesError,
       resourcesList: resourcesList ?? this.resourcesList,
     );
   }

 }


