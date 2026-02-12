import 'package:latlong2/latlong.dart';

/// Заглушка для не-web платформ: геолокация не используется.
Future<LatLng?> getUserLocation() async {
  return null;
}

