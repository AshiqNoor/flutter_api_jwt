part of '../service.dart';

class RestApi {
  static var client = http.Client();

  static Future<bool> login(LoginReqModel model) async {
    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
      //"Authorization": "Basic YWRtaW46YWRtaW4="
    };
    var url = ApiPath.login;
    var response = await client.post(Uri.parse(url),
        headers: reqheaders, body: json.encode(model.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResModel> register(RegisterReqModel model) async {
    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
      //"Authorization": "Basic YWRtaW46YWRtaW4="
    };
    var url = ApiPath.register;
    var response = await client.post(Uri.parse(url),
        headers: reqheaders, body: json.encode(model.toJson()));
    return registerResModelFromJson(response.body);
  }
}
