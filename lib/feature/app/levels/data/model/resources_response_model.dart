class ResourcesResponseModel {
  ResourcesResponseModel({
      this.msg, 
      this.data,});

  ResourcesResponseModel.fromJson(dynamic json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ResourcesResponse.fromJson(v));
      });
    }
  }
  String? msg;
  List<ResourcesResponse>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ResourcesResponse {
  ResourcesResponse({
      this.id, 
      this.resourceType, 
      this.resourceLevel, 
      this.resourceName, 
      this.resourceUrl, 
      this.resourceDescription, 
      this.createdAt, 
      this.updatedAt,});

  ResourcesResponse.fromJson(dynamic json) {
    id = json['id'];
    resourceType = json['resource_type'];
    resourceLevel = json['resource_level'];
    resourceName = json['resource_name'];
    resourceUrl = json['resource_url'];
    resourceDescription = json['resource_description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? resourceType;
  String? resourceLevel;
  String? resourceName;
  String? resourceUrl;
  String? resourceDescription;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['resource_type'] = resourceType;
    map['resource_level'] = resourceLevel;
    map['resource_name'] = resourceName;
    map['resource_url'] = resourceUrl;
    map['resource_description'] = resourceDescription;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}