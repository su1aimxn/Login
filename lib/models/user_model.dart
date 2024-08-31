// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    String userName;
    String name;
    String role;

    UserModel({
        required this.id,
        required this.userName,
        required this.name,
        required this.role,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        userName: json["user_name"],
        name: json["name"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_name": userName,
        "name": name,
        "role": role,
    };
}
