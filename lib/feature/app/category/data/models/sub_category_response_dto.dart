import 'package:acm_online/feature/app/category/domain/entities/sub_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_category_response_dto.g.dart';

@JsonSerializable()
class SubCategoryResponseDto {
  String? msg;
  List<SubCategoryDto>? data;

  SubCategoryResponseDto({this.msg, this.data});

  factory SubCategoryResponseDto.fromJson(Map<String, dynamic> json) => _$SubCategoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryResponseDtoToJson(this);
}

@JsonSerializable()
class SubCategoryDto {
  num? id;
  num? category_id;
  String? name;


  SubCategoryDto({this.id, this.category_id, this.name});

  factory SubCategoryDto.fromJson(Map<String, dynamic> json) => _$SubCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryDtoToJson(this);

  SubCategoryEntity toSubCategoryEntity(){
    return SubCategoryEntity(
      name: name,id: id ,category_id: category_id
    );
  }
}

@JsonSerializable()
class CategoryBean {
  String? name;

  CategoryBean({this.name});

  factory CategoryBean.fromJson(Map<String, dynamic> json) => _$CategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBeanToJson(this);
}

