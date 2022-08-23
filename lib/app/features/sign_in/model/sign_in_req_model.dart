part of sign_in;

LoginReqModel loginReqModelFromJson(String str) =>
    LoginReqModel.fromJson(json.decode(str));

String loginReqModelToJson(LoginReqModel data) => json.encode(data.toJson());

class LoginReqModel {
  LoginReqModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory LoginReqModel.fromJson(Map<String, dynamic> json) => LoginReqModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
