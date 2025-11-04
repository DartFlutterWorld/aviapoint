// Тест.
// Web
// const backUrl = 'http://localhost:8080/';

// Ios
// const backUrl = 'http://0.0.0.0:8080/';

//Android
// const backUrl = 'http://10.0.2.2:8080/';

// ===== ПЕРЕКЛЮЧАТЕЛЬ СЕРВЕРА =====
// Локальные и удаленные URL серверов
// const String localServerUrl = 'http://10.0.2.2:8080/'; // Android
const String localServerUrl = 'http://0.0.0.0:8080/'; // iOS
// const String localServerUrl = 'http://localhost:8080/'; // Web

const String remoteServerUrl = 'http://83.166.246.205:8080/';

// Получить текущий URL на основе состояния (используется при инициализации)
String getBackUrl({bool useLocal = false}) => useLocal ? localServerUrl : remoteServerUrl;
