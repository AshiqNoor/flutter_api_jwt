part of sign_up;

abstract class SignUpRepository {
  Future<RegisterResModel> fetchData(RegisterReqModel model);
}

class SignUpRepo extends SignUpRepository {
  @override
  Future<RegisterResModel> fetchData(RegisterReqModel model) async {
    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
    };
    final response = await BaseClient()
        .post(ApiPath.register, reqheaders, registerReqModelToJson(model));

    return registerResModelFromJson(response);
  }
}
