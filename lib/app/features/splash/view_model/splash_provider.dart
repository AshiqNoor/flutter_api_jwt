part of splash;

class SplashProvider extends ChangeNotifier {
  void validateUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    bool result = await SharedService.isLoggedIn();
    if (result) {
      Pages.goToDashboard();

      // if (auth.isEmailVerified == true) {
      //   Pages.goToDashboard();
      // } else {
      //  // Pages.goToEmailVerification();
      // }
    } else {
      Pages.goToSignIn();
    }
  }
}
