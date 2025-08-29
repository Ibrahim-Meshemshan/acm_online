// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseDto _$CategoryResponseDtoFromJson(Map<String, dynamic> json) =>
    CategoryResponseDto(
      msg: json['msg'] as String?,
      categoryList:
          (json['categoryList'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CategoryResponseDtoToJson(
  CategoryResponseDto instance,
) => <String, dynamic>{
  'msg': instance.msg,
  'categoryList': instance.categoryList,
};

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  id: json['id'] as num?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  questionCount: json['questionCount'] as num?,
);

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'questionCount': instance.questionCount,
    };
