part of '../views/screens/sign_up_screen.dart';

class SignUpProvide extends ChangeNotifier with ValidatorMixin {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  bool isLoading = false;

  void sigUp() async {
    String? usernameError = isValidName(username.text);
    String? passwordError = isValidPassword(password.text);
    String? confirmpasswordError =
        isValidConfirmPassword(password.text, confirmpassword.text);
    if (usernameError != null) {
      AppSnackbar.showMessage(usernameError);
    } else if (passwordError != null) {
      AppSnackbar.showMessage(passwordError);
    } else if (confirmpasswordError != null) {
      AppSnackbar.showMessage(confirmpasswordError);
    } else {
      isLoading = true;
      notifyListeners();
      RegisterReqModel reqModel = RegisterReqModel(
        username: username.text,
        password: password.text,
      );
      await RestApi.register(reqModel).then((resModel) {
        isLoading = false;
        notifyListeners();
        if (resModel.data.message != null) {
          AppSnackbar.showMessage(resModel.data.message);
          Pages.goToSignIn();
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
