// To parse this JSON data, do
//
//     final logout = logoutFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Logout logoutFromJson(String str) => Logout.fromJson(json.decode(str));

String logoutToJson(Logout data) => json.encode(data.toJson());

class Logout {
  String msg;

  Logout({
    required this.msg,
  });

  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
