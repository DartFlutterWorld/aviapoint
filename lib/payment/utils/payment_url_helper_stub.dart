// Stub file for non-web platforms
// This file provides a stub implementation when dart:html is not available

String getWindowOrigin() {
  // This should never be called on non-web platforms due to kIsWeb check
  // but we need to provide a stub for compilation
  return '';
}
