import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  static Future<Map<String, String?>> getTokens() async {
    return {
      'accessToken': await _storage.read(key: _accessTokenKey),
      'refreshToken': await _storage.read(key: _refreshTokenKey),
    };
  }

  static Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  static Future<bool> isAccessTokenValid() async {
    final token = await _storage.read(key: _accessTokenKey);
    if (token == null) return false;

    try {
      final payload = json.decode(utf8.decode(base64Url.decode(base64Url.normalize(token.split('.')[1]))));
      final exp = payload['exp'] as int;
      return DateTime.fromMillisecondsSinceEpoch(exp * 1000).isAfter(DateTime.now());
    } catch (e) {
      return false;
    }
  }
}
