import 'dart:async';
import 'dart:html' as html;

import 'package:latlong2/latlong.dart';

/// Получить геолокацию пользователя (только Web).
///
/// Возвращает [LatLng] или null, если доступ запрещён/ошибка/таймаут.
Future<LatLng?> getUserLocation() async {
  try {
    final geo = html.window.navigator.geolocation;

    final position = await geo.getCurrentPosition(
      enableHighAccuracy: false,
      timeout: const Duration(seconds: 5),
      maximumAge: const Duration(minutes: 10),
    );

    final coords = position.coords;
    if (coords == null) return null;

    final lat = coords.latitude?.toDouble();
    final lng = coords.longitude?.toDouble();
    if (lat == null || lng == null) return null;

    return LatLng(lat, lng);
  } catch (_) {
    return null;
  }
}

