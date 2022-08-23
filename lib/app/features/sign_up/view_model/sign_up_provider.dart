part of sign_up;

class SignUpProvide extends BaseProvider with ValidatorMixin {
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
      RegisterResModel resmodel = await SignUpRepo().fetchData(reqModel);
      isLoading = false;
      notifyListeners();
      if (resmodel.data.message != null) {
        AppSnackbar.showMessage(resmodel.message);
        Pages.goToSignIn();
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
