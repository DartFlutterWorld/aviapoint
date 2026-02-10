/// Ссылки на юридические документы для подписок (требования App Store Guideline 3.1.2).
/// В App Store Connect обязательно укажите:
/// - Privacy Policy URL в поле "Privacy Policy URL"
/// - Terms of Use (EULA): либо в описании приложения ссылку на стандартные условия Apple,
///   либо загрузите кастомный EULA в разделе App Information.
///
/// Эти константы используются в приложении для отображения рабочих ссылок
/// при оформлении подписки.

/// URL политики конфиденциальности (открывается в браузере при переходе по ссылке из виджета подписки).
/// Должен совпадать с URL, указанным в App Store Connect в поле Privacy Policy.
const String kPrivacyPolicyUrl = 'https://avia-point.com/privacy-policy';

/// URL условий использования / EULA (Terms of Use).
/// Если используете стандартный EULA Apple, укажите ссылку на него:
/// https://www.apple.com/legal/internet-services/itunes/dev/stdeula/
const String kTermsOfUseEulaUrl = 'https://avia-point.com/terms';
