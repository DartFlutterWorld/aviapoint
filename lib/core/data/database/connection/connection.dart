// Выберет web.dart, только если доступна библиотека js_interop (т.е. Web)
import 'native.dart' if (dart.library.js_interop) 'web.dart';

export 'native.dart' if (dart.library.js_interop) 'web.dart';
