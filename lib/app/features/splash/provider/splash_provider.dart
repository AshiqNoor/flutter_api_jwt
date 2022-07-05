part of '../views/splash_screen.dart';

class SplashProvider extends ChangeNotifier {
  // final auth = AuthService();
  // bool isLoading = true;

  void validateUser() async {
    // isLoading = false;
    // notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    // if (auth.isLogin) {
    //   await auth.reload();

    //   if (auth.isEmailVerified == true) {
    //     Pages.goToDashboard();
    //   } else {
    //    // Pages.goToEmailVerification();
    //   }
    // } else {
    Pages.goToSignIn();
    // }
  }
}
