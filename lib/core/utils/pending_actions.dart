/// Глобальное хранилище для отложенных действий после авторизации
class PendingActions {
  static String? _pendingAirportCode;
  static bool _hasPendingOwnershipRequest = false;
  static String? _pendingPhotoUploadAirportCode;
  static bool _hasPendingPhotoUpload = false;

  /// Установить отложенную заявку на владение аэродромом
  static void setPendingOwnershipRequest(String airportCode) {
    _pendingAirportCode = airportCode;
    _hasPendingOwnershipRequest = true;
  }

  /// Получить код аэропорта для отложенной заявки
  static String? getPendingAirportCode() {
    return _pendingAirportCode;
  }

  /// Проверить, есть ли отложенная заявка
  static bool hasPendingOwnershipRequest() {
    return _hasPendingOwnershipRequest;
  }

  /// Очистить отложенную заявку
  static void clearPendingOwnershipRequest() {
    _pendingAirportCode = null;
    _hasPendingOwnershipRequest = false;
  }

  /// Установить отложенную загрузку фотографий
  static void setPendingPhotoUpload(String airportCode) {
    _pendingPhotoUploadAirportCode = airportCode;
    _hasPendingPhotoUpload = true;
  }

  /// Получить код аэропорта для отложенной загрузки фотографий
  static String? getPendingPhotoUploadAirportCode() {
    return _pendingPhotoUploadAirportCode;
  }

  /// Проверить, есть ли отложенная загрузка фотографий
  static bool hasPendingPhotoUpload() {
    return _hasPendingPhotoUpload;
  }

  /// Очистить отложенную загрузку фотографий
  static void clearPendingPhotoUpload() {
    _pendingPhotoUploadAirportCode = null;
    _hasPendingPhotoUpload = false;
  }
}


