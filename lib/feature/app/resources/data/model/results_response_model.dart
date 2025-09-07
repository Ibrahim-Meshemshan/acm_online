// To parse this JSON data, do
//
//     final resultsResponseModel = resultsResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResultsResponseModel resultsResponseModelFromJson(String str) => ResultsResponseModel.fromJson(json.decode(str));

String resultsResponseModelToJson(ResultsResponseModel data) => json.encode(data.toJson());

class ResultsResponseModel {
  String msg;
  Data data;

  ResultsResponseModel({
    required this.msg,
    required this.data,
  });

  factory ResultsResponseModel.fromJson(Map<String, dynamic> json) => ResultsResponseModel(
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  DateTime createdAt;
  DateTime updatedAt;
  int id;
  int userId;
  int categoryId;
  int subcategoryId;
  int score;
  DateTime dataUpdatedAt;
  DateTime dataCreatedAt;

  Data({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.subcategoryId,
    required this.score,
    required this.dataUpdatedAt,
    required this.dataCreatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
    userId: json["userId"],
    categoryId: json["categoryId"],
    subcategoryId: json["subcategoryId"],
    score: json["score"],
    dataUpdatedAt: DateTime.parse(json["updated_at"]),
    dataCreatedAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
    "userId": userId,
    "categoryId": categoryId,
    "subcategoryId": subcategoryId,
    "score": score,
    "updated_at": dataUpdatedAt.toIso8601String(),
    "created_at": dataCreatedAt.toIso8601String(),
  };
}
