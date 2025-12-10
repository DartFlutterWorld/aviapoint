/// Stub реализация для не-веб платформ
class SeoHelperWeb {
  static void setTitle(String title) {}
  static void setMetaTag(String name, String content, {String? property}) {}
  static void setLinkTag(String rel, String href) {}
  static void setJsonLdScript(String jsonLd, {String id = 'structured-data'}) {}
}
