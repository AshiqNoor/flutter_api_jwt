part of '../views/screens/sign_in_screen.dart';

class SignInProvide extends ChangeNotifier with ValidatorMixin {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;

  void sigIn() async {
    String? usernameError = isValidName(username.text);
    String? passwordError = isValidPassword(password.text);
    if (usernameError != null) {
      AppSnackbar.showMessage(usernameError);
    } else if (passwordError != null) {
      AppSnackbar.showMessage(passwordError);
    } else {
      isLoading = true;
      notifyListeners();
      LoginReqModel reqModel = LoginReqModel(
        username: username.text,
        password: password.text,
      );
      await RestApi.login(reqModel).then((resModel) {
        isLoading = false;
        notifyListeners();
        if (resModel.data.token != null) {
          Pages.goToDashboard();
        } else {
          isLoading = false;
          notifyListeners();
          AppSnackbar.showMessage(resModel.message);
        }
      });
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
