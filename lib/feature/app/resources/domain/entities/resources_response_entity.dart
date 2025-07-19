class ResourcesResponseEntity {
  String? msg;
  List<ResourcesEntity>? data;

  ResourcesResponseEntity({this.msg, this.data});
}

class ResourcesEntity {
  String? id;
  String? resource_type;
  String? resource_level;
  String? resource_name;
  String? resource_url;
  String? resource_description;

  ResourcesEntity({
    this.id,
    this.resource_type,
    this.resource_level,
    this.resource_name,
    this.resource_url,
    this.resource_description,
  });
}
