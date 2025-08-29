// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesResponseDto _$ResourcesResponseDtoFromJson(
  Map<String, dynamic> json,
) => ResourcesResponseDto(
  msg: json['msg'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ResourcesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ResourcesResponseDtoToJson(
  ResourcesResponseDto instance,
) => <String, dynamic>{'msg': instance.msg, 'data': instance.data};
