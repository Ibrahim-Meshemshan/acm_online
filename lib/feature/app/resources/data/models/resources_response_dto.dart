import 'package:acm_online/feature/app/resources/domain/entities/resources_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resources_response_dto.g.dart';

@JsonSerializable()
class ResourcesResponseDto {
  String? msg;
  List<ResourcesDto>? data;

  ResourcesResponseDto({this.msg, this.data});

  factory ResourcesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResourcesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesResponseDtoToJson(this);
}

class ResourcesDto {
  final dynamic id;
  final String? resource_type;
  final String? resource_level;
  final String? resource_name;
  final String? resource_url;
  final String? resource_description;
  final int? createdAt;
  final int? updatedAt;

  ResourcesDto({
    this.id,
    this.resource_type,
    this.resource_level,
    this.resource_name,
    this.resource_url,
    this.resource_description,
    this.createdAt,
    this.updatedAt,
  });

  ResourcesEntity toEntity() {
    return ResourcesEntity(
      id: id,
      resource_url: resource_url,
      resource_type: resource_type,
      resource_name: resource_name,
      resource_level: resource_level,
      resource_description: resource_description,
    );
  }

  factory ResourcesDto.fromJson(Map<String, dynamic> json) => ResourcesDto(
    id: json['id']?.toString(),
    // تحويل أي نوع إلى String
    resource_type: json['resource_type'] as String?,
    resource_level: json['resource_level'] as String?,
    resource_name: json['resource_name'] as String?,
    resource_url: json['resource_url'] as String?,
    resource_description: json['resource_description'] as String?,

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'resource_type': resource_type,
    'resource_level': resource_level,
    'resource_name': resource_name,
    'resource_url': resource_url,
    'resource_description': resource_description,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
