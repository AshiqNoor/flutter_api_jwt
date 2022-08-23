part of provider;

List<SingleChildWidget> provider = [
  ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
  ChangeNotifierProvider<SignUpProvide>(create: (_) => SignUpProvide()),
  ChangeNotifierProvider<SignInProvide>(create: (_) => SignInProvide()),
  ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
];
