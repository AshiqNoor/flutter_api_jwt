part of routes;

class AppPages {
  // when the app is opened, this page will be the first to be shown
  static const initial = Routes.splash;

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      default:
        throw Exception('Routs not found');
    }
  }
}
