// To parse this JSON data, do
//
//     final subCategoryResponseModel = subCategoryResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SubCategoryResponseModel subCategoryResponseModelFromJson(String str) => SubCategoryResponseModel.fromJson(json.decode(str));

String subCategoryResponseModelToJson(SubCategoryResponseModel data) => json.encode(data.toJson());

class SubCategoryResponseModel {
  String msg;
  List<SubCategoryResponse> data;

  SubCategoryResponseModel({
    required this.msg,
    required this.data,
  });

  factory SubCategoryResponseModel.fromJson(Map<String, dynamic> json) => SubCategoryResponseModel(
    msg: json["msg"],
    data: List<SubCategoryResponse>.from(json["data"].map((x) => SubCategoryResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SubCategoryResponse {
  int id;
  int categoryId;
  String name;
  Category category;

  SubCategoryResponse({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.category,
  });

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) => SubCategoryResponse(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "category": category.toJson(),
  };
}

class Category {
  String name;
  int id;

  Category({
    required this.name,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
