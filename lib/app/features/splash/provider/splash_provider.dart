part of '../views/splash_screen.dart';

class SplashProvider extends ChangeNotifier {
  bool isLoading = true;

  void validateUser() async {
    // isLoading = false;
    // notifyListeners();
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
