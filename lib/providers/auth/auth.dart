import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  final FlutterAppAuth _appAuth = FlutterAppAuth();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  bool isBusy = false;
  bool isLoggedIn = false;
  String? errorMessage;
  String? name;
  String? picture;

  // Map<String, dynamic> _parseIdToken(String idToken) {}

  // Future<Map> _getUserDetails(String accessToken) async {}

  // Future<void> _loginAction() async {}

  // void _logoutAction() async {}
}
