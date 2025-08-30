// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryResponseModel categoryResponseModelFromJson(String str) => CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  String msg;
  List<CategoryResponse> data;

  CategoryResponseModel({
    required this.msg,
    required this.data,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    msg: json["msg"],
    data: List<CategoryResponse>.from(json["data"].map((x) => CategoryResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryResponse {
  int id;
  String name;
  dynamic description;
  int questionCount;

  CategoryResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.questionCount,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    questionCount: json["questionCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "questionCount": questionCount,
  };
}
