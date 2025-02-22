/// Simple ServiceLocator
///
/// Register service:
/// ```
/// ServiceLocator.instance.set<SettingsProvider>(SettingsProviderSecureStorage());
/// ```
///
/// Use service:
/// ```
/// final service = ServiceLocator.instance.get<SettingsProvider>();
/// ```
class ServiceLocator {
  // MARK: - Private variables.
  final Map<dynamic, dynamic> _data = {};

  /// Singleton instance of the service locator.
  static final ServiceLocator instance = ServiceLocator._();

  // MARK: - Private constructor.
  ServiceLocator._();

  /// Registers the given service under the given type parameter in the
  /// service locator, creating a stack for service's type
  void set<T>(T service) {
    instance._data[T.toString()] = service;
  }

  /// Locates the last added service of the given type parameter.
  ///
  /// Throws an Exception if requested service is not registered
  T get<T>() {
    final service = instance._data[T.toString()];
    if (service == null) throw Exception("$T is not registered in ServiceLocator");

    return service;
  }
}
