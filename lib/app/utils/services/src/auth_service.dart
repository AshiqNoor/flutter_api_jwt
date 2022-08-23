part of services;

class RestApi {
  static final client = http.Client();

  static Future<dynamic> login(LoginReqModel model) async {
    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
    };
    try {
      var url = ApiPath.login;
      var response = await client.post(
        Uri.parse(url),
        headers: reqheaders,
        body: loginReqModelToJson(model),
      );

      if (response.statusCode == 200) {
        await SharedService.setLoginDetails(
            loginResModelFromJson(response.body));
        return loginResModelFromJson(response.body);
      } else {
        return loginResModelFromJson(response.body);
      }
    } catch (e) {
      //print(e);
    }
  }

  static Future<dynamic> register(RegisterReqModel model) async {
    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
    };
    try {
      var url = ApiPath.register;
      var response = await client.post(
        Uri.parse(url),
        headers: reqheaders,
        body: registerReqModelToJson(model),
      );
      if (response.statusCode == 200) {
        return registerResModelFromJson(response.body);
      } else if (response.statusCode == 500) {
        return registerResModelFromJson(response.body);
      } else {
        return loginResModelFromJson(response.body);
      }
    } catch (e) {
      // print(e);
    }
  }

  static Future<dynamic> userprofile() async {
    try {
      var token = await SharedService.loginDetails();
      if (token != null) {
        Map<String, String> reqheaders = {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token.data.token}"
        };
        var url = ApiPath.profile;
        var response = await client.get(Uri.parse(url), headers: reqheaders);

        if (response.statusCode == 200) {
          return userProfileResModelFromJson(response.body);
        } else if (response.statusCode == 403) {
          return userProfileResModelFromJson(response.body);
        }
      }
    } catch (e) {
      // print(e);
    }
  }
}
