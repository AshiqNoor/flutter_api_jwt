import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/constants/app_constants.dart';
part '../provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<SplashProvider>().validateUser();
    // });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            ImagePath.background,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
