part of 'app_constants.dart';

class ApiPath {
  static const _baseUrl = "http://192.168.0.102:3000/api/v1";

  static const login = "$_baseUrl/login";
  static const register = "$_baseUrl/register";
  static const profile = "$_baseUrl/user-Profile";
  static const stock = "$_baseUrl/stock";
}
