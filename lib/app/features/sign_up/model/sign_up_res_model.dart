part of '../views/screens/sign_up_screen.dart';

RegisterResModel registerResModelFromJson(String str) =>
    RegisterResModel.fromJson(json.decode(str));

String registerResModelToJson(RegisterResModel data) =>
    json.encode(data.toJson());

class RegisterResModel {
  RegisterResModel({
    required this.message,
    required this.data,
  });

  final String message;
  final Data data;

  factory RegisterResModel.fromJson(Map<String, dynamic> json) =>
      RegisterResModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.message,
  });

  final String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
