part of '../service.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var iskeyExist = await SharedPreferences.getInstance().then((prefs) {
      return prefs.containsKey(AppConstant.token);
    });
    //print("iskeyExist'$iskeyExist'");
    return iskeyExist;
  }

  static Future<void> setLoginDetails(LoginResModel model) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstant.token, json.encode(model.toJson()));
  }

  static Future<LoginResModel?> loginDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var iskeyExist = prefs.containsKey(AppConstant.token);
    if (iskeyExist) {
      var cachedToken = prefs.getString(AppConstant.token);
      return loginResModelFromJson(cachedToken.toString());
      //LoginResModel.fromJson(json.decode(cachedToken));
    }
    return null;
  }

  static Future<void> logOut() async {
    var iskeyExists = await SharedPreferences.getInstance();
    iskeyExists.remove(AppConstant.token);
    // Pages.goToSignIn();
  }
}
