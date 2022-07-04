part of '../routing.dart';

class Pages {
  static void goToSplash() =>
      navigatorKey.currentState!.pushReplacementNamed(Routes.splash);
  static void goToSignIn() =>
      navigatorKey.currentState!.pushReplacementNamed(Routes.signIn);
  static void goToSignUp() =>
      navigatorKey.currentState!.pushNamed(Routes.signUp);
  static void goToDashboard() =>
      navigatorKey.currentState!.pushReplacementNamed(Routes.dashboard);
}
