// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponseDto _$SubCategoryResponseDtoFromJson(
  Map<String, dynamic> json,
) => SubCategoryResponseDto(
  msg: json['msg'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SubCategoryResponseDtoToJson(
  SubCategoryResponseDto instance,
) => <String, dynamic>{'msg': instance.msg, 'data': instance.data};

SubCategoryDto _$SubCategoryDtoFromJson(Map<String, dynamic> json) =>
    SubCategoryDto(
      id: json['id'] as num?,
      category_id: json['category_id'] as num?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SubCategoryDtoToJson(SubCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'name': instance.name,
    };

CategoryBean _$CategoryBeanFromJson(Map<String, dynamic> json) =>
    CategoryBean(name: json['name'] as String?);

Map<String, dynamic> _$CategoryBeanToJson(CategoryBean instance) =>
    <String, dynamic>{'name': instance.name};
