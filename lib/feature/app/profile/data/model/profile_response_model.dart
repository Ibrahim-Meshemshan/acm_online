// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
  String msg;
  ProfileResponse data;

  ProfileResponseModel({
    required this.msg,
    required this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
    msg: json["msg"],
    data: ProfileResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data.toJson(),
  };
}

class ProfileResponse {
  int globalRank;
  int userId;
  String firstName;
  String lastName;
  String email;
  int totalScore;
  int quizCount;
  DateTime joinedDate;
  List<UserCategoriesScore> userCategoriesScore;

  ProfileResponse({
    required this.globalRank,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.totalScore,
    required this.quizCount,
    required this.joinedDate,
    required this.userCategoriesScore,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    globalRank: json["globalRank"],
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    totalScore: json["totalScore"],
    quizCount: json["quizCount"],
    joinedDate: DateTime.parse(json["joinedDate"]),
    userCategoriesScore: List<UserCategoriesScore>.from(json["userCategoriesScore"].map((x) => UserCategoriesScore.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "globalRank": globalRank,
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "totalScore": totalScore,
    "quizCount": quizCount,
    "joinedDate": joinedDate.toIso8601String(),
    "userCategoriesScore": List<dynamic>.from(userCategoriesScore.map((x) => x.toJson())),
  };
}

class UserCategoriesScore {
  int userId;
  String firstName;
  String lastName;
  String email;
  int categoryId;
  String categoryName;
  int subcategoryId;
  String subcategoryName;
  int subcategoryScore;
  int quizzesTaken;

  UserCategoriesScore({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.categoryId,
    required this.categoryName,
    required this.subcategoryId,
    required this.subcategoryName,
    required this.subcategoryScore,
    required this.quizzesTaken,
  });

  factory UserCategoriesScore.fromJson(Map<String, dynamic> json) => UserCategoriesScore(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    subcategoryId: json["subcategoryId"],
    subcategoryName: json["subcategoryName"],
    subcategoryScore: json["subcategoryScore"],
    quizzesTaken: json["quizzesTaken"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "subcategoryId": subcategoryId,
    "subcategoryName": subcategoryName,
    "subcategoryScore": subcategoryScore,
    "quizzesTaken": quizzesTaken,
  };
}
