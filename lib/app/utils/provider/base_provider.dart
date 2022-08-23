part of provider;

class BaseProvider with ChangeNotifier {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmpasswordFocusNode = FocusNode();
  bool isLoading = false;
  bool isActive = false;
  bool isAutoFocus = true;
  bool isObscure = true;

  void obsecure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      isLoading = true;
      notifyListeners();
      await SharedService.logOut();
      isLoading = false;
      notifyListeners();
      Pages.goToSignIn();
    } catch (_) {}
  }
}
