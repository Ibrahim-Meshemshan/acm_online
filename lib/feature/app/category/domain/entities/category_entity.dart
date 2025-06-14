class CategoryResponseEntity {
  String? msg;
  List<CategoryEntity>? listCategoryEntity;

  CategoryResponseEntity({this.msg, this.listCategoryEntity});
}

class CategoryEntity {
  num? id;
  String? name;
  String? description;
  num? questionCount;

  CategoryEntity({this.id, this.name, this.description, this.questionCount});
}
