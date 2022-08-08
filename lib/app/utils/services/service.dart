import 'dart:async';
import 'dart:convert';

import 'package:flutter_api_jwt/app/constants/app_constants.dart';
import 'package:flutter_api_jwt/app/features/dashboard/views/screens/dashboard_screen.dart';

import 'package:flutter_api_jwt/app/features/sign_in/views/screens/sign_in_screen.dart';
import 'package:flutter_api_jwt/app/features/sign_up/views/screens/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part "../services/src/auth_service.dart";
part '../services/src/shared_service.dart';
