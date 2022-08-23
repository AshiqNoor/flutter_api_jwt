part of sign_in;

abstract class SignInRepository {
  Future<LoginResModel> fetchData(LoginReqModel model);
  //Future<LoginResModel> fetchData1(LoginReqModel model);
}

class SignInRepo extends SignInRepository {
  @override
  Future<LoginResModel> fetchData(LoginReqModel model) async {
    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
    };

    final response = await BaseClient()
        .post(ApiPath.login, reqheaders, loginReqModelToJson(model));

    if (jsonDecode(response)['message'] == "Success") {
      await SharedService.setLoginDetails(loginResModelFromJson(response));
      return loginResModelFromJson(response);
    } else {
      return loginResModelFromJson(response);
    }
  }
}
