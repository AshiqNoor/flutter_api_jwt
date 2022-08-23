part of sign_in;

class SignInProvide extends BaseProvider with ValidatorMixin {
  void signIn() async {
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
      LoginResModel resmodel = await SignInRepo().fetchData(reqModel);
      if (resmodel.data.token != null) {
        isLoading = false;
        notifyListeners();
        Pages.goToDashboard();
      } else {
        isLoading = false;
        notifyListeners();
        AppSnackbar.showMessage(resmodel.message);
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
