part of '../views/screens/sign_up_screen.dart';

RegisterReqModel registerReqModelFromJson(String str) =>
    RegisterReqModel.fromJson(json.decode(str));

String registerReqModelToJson(RegisterReqModel data) =>
    json.encode(data.toJson());

class RegisterReqModel {
  RegisterReqModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory RegisterReqModel.fromJson(Map<String, dynamic> json) =>
      RegisterReqModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
