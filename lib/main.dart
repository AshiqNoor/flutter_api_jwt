import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/config/routes/routes_library.dart';
import 'package:flutter_api_jwt/app/config/thrmes/themes_library.dart';
import 'package:flutter_api_jwt/app/utils/provider/provider_library.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: provider,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Api JWT',
          theme: AppTheme.basic,
          initialRoute: AppPages.initial,
          onGenerateRoute: AppPages.routes,
        );
      },
    );
  }
}
