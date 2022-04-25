// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

class UserModel {
  UserModel({
    this.login,
    this.avatarUrl,
    this.type,
  });

  String? login;

  String? avatarUrl;

  String? type;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        type: json["type"],
      );
}
