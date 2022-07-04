// part of 'app_mixins.dart';
part of app_mixins;

List<SingleChildWidget> provider = [
  ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
  ChangeNotifierProvider<SignUpProvide>(create: (_) => SignUpProvide()),
  ChangeNotifierProvider<SignInProvide>(create: (_) => SignInProvide()),
  ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
];
