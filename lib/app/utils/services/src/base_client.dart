part of services;

class BaseClient {
  //static const int timeOutDuration = 10;

  //GET
  Future<dynamic> get(String url, dynamic header) async {
    var uri = Uri.parse(url);
    try {
      var response = await http
          .get(uri, headers: header)
          .timeout(const Duration(seconds: AppConstant.timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      Map<String, dynamic> response = {
        "message": "${ExceptionHandlers().getExceptionString(e)}",
        "data": []
      };
      return jsonEncode(response);
    }
  }

  //POST
  Future<dynamic> post(String url, dynamic header, dynamic body) async {
    var uri = Uri.parse(url);
    var payload = body;
    try {
      var response = await http
          .post(uri, headers: header, body: payload)
          .timeout(const Duration(seconds: AppConstant.timeOutDuration));

      return _processResponse(response);
    } catch (e) {
      Map<String, dynamic> response = {
        "message": "${ExceptionHandlers().getExceptionString(e)}",
        "data": {}
      };
      return jsonEncode(response);
    }
  }

  //DELETE

  //UPDATE

  //PUT

//----------------------ERROR STATUS CODES----------------------

  dynamic _processResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      // Map<String, dynamic> response1 = {
      //   "message": "Session Expire",
      //   "data": []
      // };
      // return jsonEncode(response1);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
        var responseJson = response.body;
        return responseJson;
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}
