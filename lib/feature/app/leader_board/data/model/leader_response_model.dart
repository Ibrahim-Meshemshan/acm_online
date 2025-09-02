// To parse this JSON data, do
//
//     final leaderResponseModel = leaderResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LeaderResponseModel leaderResponseModelFromJson(String str) => LeaderResponseModel.fromJson(json.decode(str));

String leaderResponseModelToJson(LeaderResponseModel data) => json.encode(data.toJson());

class LeaderResponseModel {
  String msg;
  LeaderResponse data;

  LeaderResponseModel({
    required this.msg,
    required this.data,
  });

  factory LeaderResponseModel.fromJson(Map<String, dynamic> json) => LeaderResponseModel(
    msg: json["msg"],
    data: LeaderResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data.toJson(),
  };
}

class LeaderResponse {
  List<UserScore> userScores;
  List<UserSubcategoryScore> userSubcategoryScores;

  LeaderResponse({
    required this.userScores,
    required this.userSubcategoryScores,
  });

  factory LeaderResponse.fromJson(Map<String, dynamic> json) => LeaderResponse(
    userScores: List<UserScore>.from(json["userScores"].map((x) => UserScore.fromJson(x))),
    userSubcategoryScores: List<UserSubcategoryScore>.from(json["userSubcategoryScores"].map((x) => UserSubcategoryScore.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userScores": List<dynamic>.from(userScores.map((x) => x.toJson())),
    "userSubcategoryScores": List<dynamic>.from(userSubcategoryScores.map((x) => x.toJson())),
  };
}

class UserScore {
  int userId;
  String firstName;
  String lastName;
  String email;
  int totalScore;
  int quizCount;
  DateTime joinedDate;

  UserScore({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.totalScore,
    required this.quizCount,
    required this.joinedDate,
  });

  factory UserScore.fromJson(Map<String, dynamic> json) => UserScore(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    totalScore: json["totalScore"],
    quizCount: json["quizCount"],
    joinedDate: DateTime.parse(json["joinedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "totalScore": totalScore,
    "quizCount": quizCount,
    "joinedDate": joinedDate.toIso8601String(),
  };
}

class UserSubcategoryScore {
  int userId;
  String firstName;
  String lastName;
  String email;
  int categoryId;
  CategoryName categoryName;
  int subcategoryId;
  String subcategoryName;
  int subcategoryScore;
  int quizzesTaken;

  UserSubcategoryScore({
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

  factory UserSubcategoryScore.fromJson(Map<String, dynamic> json) => UserSubcategoryScore(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    categoryId: json["categoryId"],
    categoryName: categoryNameValues.map[json["categoryName"]]!,
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
    "categoryName": categoryNameValues.reverse[categoryName],
    "subcategoryId": subcategoryId,
    "subcategoryName": subcategoryName,
    "subcategoryScore": subcategoryScore,
    "quizzesTaken": quizzesTaken,
  };
}

enum CategoryName {
  PROBLEM_SOLVING,
  PROGRAMMING_LANGUAGES
}

final categoryNameValues = EnumValues({
  "Problem Solving": CategoryName.PROBLEM_SOLVING,
  "Programming Languages": CategoryName.PROGRAMMING_LANGUAGES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
