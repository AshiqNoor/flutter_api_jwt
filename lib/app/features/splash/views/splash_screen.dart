import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/config/routes/routing.dart';
import 'package:flutter_api_jwt/app/constants/app_constants.dart';
import 'package:provider/provider.dart';
part '../provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().validateUser();
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Image.asset(
            ImagePath.logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
