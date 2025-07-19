class SubCategoryResponseEntity {
  String? msg;
  List<SubCategoryEntity>? subCategoryList;

  SubCategoryResponseEntity({this.msg, this.subCategoryList});
}

class SubCategoryEntity {
  num? id;
  num? category_id;
  String? name;
  SubCategoryEntity({this.id, this.category_id, this.name});
}

