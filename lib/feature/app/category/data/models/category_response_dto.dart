import 'package:acm_online/feature/app/category/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDto {
  String? msg;
  List<CategoryDto>? categoryList;

  CategoryResponseDto({this.msg, this.categoryList});

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseDtoToJson(this);
}

@JsonSerializable()
class CategoryDto {
  num? id;
  String? name;
  String? description;
  num? questionCount;

  CategoryDto({this.id, this.name, this.description, this.questionCount});

  CategoryEntity toCategoryEntity() {
    return CategoryEntity(
      id: id,
      description: description,
      name: name,
      questionCount: questionCount,
    );
  }

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
