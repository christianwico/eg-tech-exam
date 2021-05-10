import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:exam/constants.dart';

class Auth extends ChangeNotifier {
  final FlutterAppAuth _appAuth = FlutterAppAuth();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  bool isBusy = false;
  bool isLoggedIn = false;
  String? errorMessage;
  String? name;
  String? picture;

  Map<String, dynamic> _parseIdToken(String idToken) {
    final List<String> parts = idToken.split(r'.');

    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<void> _updateProfile(TokenResponse result) async {
    final Map<String, dynamic> idToken = _parseIdToken(result.idToken!);
    final Map<String, dynamic> profile =
        await _getUserDetails(result.accessToken!);

    await FlutterSecureStorage().write(
      key: SECURE_REFRESH_TOKEN,
      value: result.refreshToken!,
    );

    isBusy = true;
    isLoggedIn = true;
    name = idToken['name'];

    notifyListeners();
  }

  // Get user details manually from Auth0.
  Future<Map<String, dynamic>> _getUserDetails(String accessToken) async {
    final Uri uri = Uri.parse('https://$AUTH0_DOMAIN/userinfo');
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

  void init() async {
    // Prevent concurrency during init.
    if (isBusy) {
      return;
    }

    final String? refreshToken =
        await FlutterSecureStorage().read(key: SECURE_REFRESH_TOKEN);

    if (refreshToken == null) {
      return;
    }

    isBusy = true;

    notifyListeners();

    try {
      final FlutterAppAuth appAuth = FlutterAppAuth();
      final TokenResponse? result = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: refreshToken,
      ));

      await _updateProfile(result!);
    } catch (e, s) {
      print('[LOGIN ERROR]: $e - $s');

      // Logout if things go wrong regardless of previous state.
      logoutAction();
    }
  }

  Future<void> loginViaGoogleAction() async {
    isBusy = true;
    errorMessage = null;

    try {
      final FlutterAppAuth appAuth = FlutterAppAuth();
      final AuthorizationTokenResponse? result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: AUTH0_ISSUER,
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login'],
        ),
      );

      await _updateProfile(result!);
    } catch (e, s) {
      print('[LOGIN ERROR]: $e - $s');

      isBusy = false;
      isLoggedIn = false;
      errorMessage = e.toString();

      notifyListeners();
    }
  }

  void logoutAction() async {
    await FlutterSecureStorage().delete(key: SECURE_REFRESH_TOKEN);

    isLoggedIn = false;
    isBusy = false;

    notifyListeners();
  }
}
