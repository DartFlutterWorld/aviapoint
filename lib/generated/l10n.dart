// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Рынок`
  String get offers {
    return Intl.message('Рынок', name: 'offers', desc: '', args: []);
  }

  /// `Сделки`
  String get deals {
    return Intl.message('Сделки', name: 'deals', desc: '', args: []);
  }

  /// `Аналитика`
  String get analitics {
    return Intl.message('Аналитика', name: 'analitics', desc: '', args: []);
  }

  /// `Отчёты`
  String get repots {
    return Intl.message('Отчёты', name: 'repots', desc: '', args: []);
  }

  /// `Профиль`
  String get profile {
    return Intl.message('Профиль', name: 'profile', desc: '', args: []);
  }

  /// `Цены`
  String get prices {
    return Intl.message('Цены', name: 'prices', desc: '', args: []);
  }

  /// `Silk`
  String get auth_title {
    return Intl.message('Silk', name: 'auth_title', desc: '', args: []);
  }

  /// `Закупка зерновых культур по всей России\n Покупка и продажа аграрной продукции`
  String get auth_subtitle {
    return Intl.message(
      'Закупка зерновых культур по всей России\n Покупка и продажа аграрной продукции',
      name: 'auth_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ваш логин`
  String get auth_login {
    return Intl.message('Ваш логин', name: 'auth_login', desc: '', args: []);
  }

  /// `Пароль`
  String get auth_password {
    return Intl.message('Пароль', name: 'auth_password', desc: '', args: []);
  }

  /// `Войти`
  String get auth_btn {
    return Intl.message('Войти', name: 'auth_btn', desc: '', args: []);
  }

  /// `Что-то пошло не так. Пожалуйста, попробуйте напечатать заново`
  String get auth_error {
    return Intl.message(
      'Что-то пошло не так. Пожалуйста, попробуйте напечатать заново',
      name: 'auth_error',
      desc: '',
      args: [],
    );
  }

  /// `Рынок`
  String get offers_title {
    return Intl.message('Рынок', name: 'offers_title', desc: '', args: []);
  }

  /// `Цена «на колесах» без НДС (с погрузкой в машину)`
  String get offers_subtitle {
    return Intl.message(
      'Цена «на колесах» без НДС (с погрузкой в машину)',
      name: 'offers_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Цена с НДС`
  String get offer_price_nds {
    return Intl.message('Цена с НДС', name: 'offer_price_nds', desc: '', args: []);
  }

  /// `Цена без НДС`
  String get offer_price_wnds {
    return Intl.message('Цена без НДС', name: 'offer_price_wnds', desc: '', args: []);
  }

  /// `Объем`
  String get offer_weight {
    return Intl.message('Объем', name: 'offer_weight', desc: '', args: []);
  }

  /// `Срок вывоза`
  String get offer_age {
    return Intl.message('Срок вывоза', name: 'offer_age', desc: '', args: []);
  }

  /// `Cырая клейковина`
  String get offer_kley {
    return Intl.message('Cырая клейковина', name: 'offer_kley', desc: '', args: []);
  }

  /// `Стекловидность`
  String get offer_stekl {
    return Intl.message('Стекловидность', name: 'offer_stekl', desc: '', args: []);
  }

  /// `Натура`
  String get offer_nature {
    return Intl.message('Натура', name: 'offer_nature', desc: '', args: []);
  }

  /// `Влага`
  String get offer_vlaga {
    return Intl.message('Влага', name: 'offer_vlaga', desc: '', args: []);
  }

  /// `Сорная примесь`
  String get offer_primes {
    return Intl.message('Сорная примесь', name: 'offer_primes', desc: '', args: []);
  }

  /// `Введите объем сделки - целое значение (т)`
  String get offer_enter_weight {
    return Intl.message('Введите объем сделки - целое значение (т)', name: 'offer_enter_weight', desc: '', args: []);
  }

  /// `Выберите склад отгрузки`
  String get offer_select_address {
    return Intl.message('Выберите склад отгрузки', name: 'offer_select_address', desc: '', args: []);
  }

  /// `Финальная стоимость с НДС`
  String get offer_final_price_nds {
    return Intl.message('Финальная стоимость с НДС', name: 'offer_final_price_nds', desc: '', args: []);
  }

  /// `Финальная стоимость без НДС`
  String get offer_final_price {
    return Intl.message('Финальная стоимость без НДС', name: 'offer_final_price', desc: '', args: []);
  }

  /// `Принять сделку`
  String get offer_accept {
    return Intl.message('Принять сделку', name: 'offer_accept', desc: '', args: []);
  }

  /// `Нажимая кнопку Принять сделку, вы соглашаетесь с `
  String get offer_offert {
    return Intl.message('Нажимая кнопку Принять сделку, вы соглашаетесь с ', name: 'offer_offert', desc: '', args: []);
  }

  /// `условия оферты`
  String get offer_offert_accept {
    return Intl.message('условия оферты', name: 'offer_offert_accept', desc: '', args: []);
  }

  /// `Цена за тонну`
  String get offer_offert_price_per_ton {
    return Intl.message('Цена за тонну', name: 'offer_offert_price_per_ton', desc: '', args: []);
  }

  /// `Сообщение покупателю`
  String get offer_offert_my_message {
    return Intl.message('Сообщение покупателю', name: 'offer_offert_my_message', desc: '', args: []);
  }

  /// `Отправить предложение`
  String get offer_offert_send_my_offer {
    return Intl.message('Отправить предложение', name: 'offer_offert_send_my_offer', desc: '', args: []);
  }

  /// `Условиями лицензионного договора`
  String get offer_offert_accept_license {
    return Intl.message('Условиями лицензионного договора', name: 'offer_offert_accept_license', desc: '', args: []);
  }

  /// `Политикой обработки персональных данных`
  String get offer_offert_accept_consentPersonalData {
    return Intl.message(
      'Политикой обработки персональных данных',
      name: 'offer_offert_accept_consentPersonalData',
      desc: '',
      args: [],
    );
  }

  /// `Электронный документооборот (ЭДО)`
  String get profile_edo_title {
    return Intl.message('Электронный документооборот (ЭДО)', name: 'profile_edo_title', desc: '', args: []);
  }

  /// `Для подписания документов необходимо выпустить УКЭП`
  String get profile_edo_subtitle {
    return Intl.message(
      'Для подписания документов необходимо выпустить УКЭП',
      name: 'profile_edo_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Подключить ЭДО`
  String get profile_edo_connect {
    return Intl.message('Подключить ЭДО', name: 'profile_edo_connect', desc: '', args: []);
  }

  /// `Мои адреса`
  String get profile_adresses {
    return Intl.message('Мои адреса', name: 'profile_adresses', desc: '', args: []);
  }

  /// `О приложении`
  String get profile_about {
    return Intl.message('О приложении', name: 'profile_about', desc: '', args: []);
  }

  /// `Связаться с нами`
  String get profile_backfeed {
    return Intl.message('Связаться с нами', name: 'profile_backfeed', desc: '', args: []);
  }

  /// `Выйти`
  String get profile_exit {
    return Intl.message('Выйти', name: 'profile_exit', desc: '', args: []);
  }

  /// `Сделано с 🖤 командой Silk`
  String get profile_copyright {
    return Intl.message('Сделано с 🖤 командой Silk', name: 'profile_copyright', desc: '', args: []);
  }

  /// `Версия {version}`
  String profile_version(Object version) {
    return Intl.message('Версия $version', name: 'profile_version', desc: '', args: [version]);
  }

  /// `Silk`
  String get profile_about_title {
    return Intl.message('Silk', name: 'profile_about_title', desc: '', args: []);
  }

  /// `Закупка зерновых по всей России. Покупка и продажа аграрной продукции`
  String get profile_about_subtitle {
    return Intl.message(
      'Закупка зерновых по всей России. Покупка и продажа аграрной продукции',
      name: 'profile_about_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `О нас`
  String get profile_about_title1 {
    return Intl.message('О нас', name: 'profile_about_title1', desc: '', args: []);
  }

  /// `Silk - частная международная группа, занимающаяся торговлей сельскохозяйственными товарами. Материнская компания группы - DAYLES HOLDING LIMITED, оперирует на территории Европы под единым брэндом Daylesford Merchant. В России интересы группы представляет компания ООО "Дейлсфорд Мёрчант"`
  String get profile_about_text1 {
    return Intl.message(
      'Silk - частная международная группа, занимающаяся торговлей сельскохозяйственными товарами. Материнская компания группы - DAYLES HOLDING LIMITED, оперирует на территории Европы под единым брэндом Daylesford Merchant. В России интересы группы представляет компания ООО "Дейлсфорд Мёрчант"',
      name: 'profile_about_text1',
      desc: '',
      args: [],
    );
  }

  /// `Основные контрагенты`
  String get profile_about_title2 {
    return Intl.message('Основные контрагенты', name: 'profile_about_title2', desc: '', args: []);
  }

  /// `Основными нашими контрагентами являются крупнейшие товарные трейдеры, давно оперирующие на рынке. Сотрудничество с ними дает уверенность в соблюдении всех коммерческих и финансовых договоренностей в заключаемых контрактах.`
  String get profile_about_text2 {
    return Intl.message(
      'Основными нашими контрагентами являются крупнейшие товарные трейдеры, давно оперирующие на рынке. Сотрудничество с ними дает уверенность в соблюдении всех коммерческих и финансовых договоренностей в заключаемых контрактах.',
      name: 'profile_about_text2',
      desc: '',
      args: [],
    );
  }

  /// `Мои адреса`
  String get profile_address_title {
    return Intl.message('Мои адреса', name: 'profile_address_title', desc: '', args: []);
  }

  /// `Добавить адрес`
  String get profile_address_add {
    return Intl.message('Добавить адрес', name: 'profile_address_add', desc: '', args: []);
  }

  /// `Введите адрес...`
  String get profile_address_enter {
    return Intl.message('Введите адрес...', name: 'profile_address_enter', desc: '', args: []);
  }

  /// `Сохранить`
  String get profile_address_save {
    return Intl.message('Сохранить', name: 'profile_address_save', desc: '', args: []);
  }

  /// `Удалить`
  String get profile_address_delete {
    return Intl.message('Удалить', name: 'profile_address_delete', desc: '', args: []);
  }

  /// `Удалить этот адрес?`
  String get profile_address_dialog_title {
    return Intl.message('Удалить этот адрес?', name: 'profile_address_dialog_title', desc: '', args: []);
  }

  /// `Да, удалить`
  String get profile_address_dialog_confirm {
    return Intl.message('Да, удалить', name: 'profile_address_dialog_confirm', desc: '', args: []);
  }

  /// `Данные о компании`
  String get profile_my_company {
    return Intl.message('Данные о компании', name: 'profile_my_company', desc: '', args: []);
  }

  /// `Политика конфиденциальности`
  String get profile_policy {
    return Intl.message('Политика конфиденциальности', name: 'profile_policy', desc: '', args: []);
  }

  /// `Лицензионный договор`
  String get profile_license_kontrakt {
    return Intl.message('Лицензионный договор', name: 'profile_license_kontrakt', desc: '', args: []);
  }

  /// `Обработка персональных данных`
  String get person_data {
    return Intl.message('Обработка персональных данных', name: 'person_data', desc: '', args: []);
  }

  /// `Мы находимся по адресу`
  String get profile_contact_us_address {
    return Intl.message('Мы находимся по адресу', name: 'profile_contact_us_address', desc: '', args: []);
  }

  /// `117447, г. Москва, ул. Большая Черемушкинская д. 13 стр. 4, пом. 2, ком. 23`
  String get profile_contact_us_address1 {
    return Intl.message(
      '117447, г. Москва, ул. Большая Черемушкинская д. 13 стр. 4, пом. 2, ком. 23',
      name: 'profile_contact_us_address1',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта`
  String get profile_contact_us_email {
    return Intl.message('Электронная почта', name: 'profile_contact_us_email', desc: '', args: []);
  }

  /// `info@silktech.one`
  String get profile_contact_us_email1 {
    return Intl.message('info@silktech.one', name: 'profile_contact_us_email1', desc: '', args: []);
  }

  /// `Сделки`
  String get deals_title {
    return Intl.message('Сделки', name: 'deals_title', desc: '', args: []);
  }

  /// `Цена «на колесах» без НДС (с погрузкой в машину)`
  String get deals_subtitle {
    return Intl.message('Цена «на колесах» без НДС (с погрузкой в машину)', name: 'deals_subtitle', desc: '', args: []);
  }

  /// `Завершенные - {count}`
  String deals_completed(Object count) {
    return Intl.message('Завершенные - $count', name: 'deals_completed', desc: '', args: [count]);
  }

  /// `Аннулированные - {count}`
  String deals_canceled(Object count) {
    return Intl.message('Аннулированные - $count', name: 'deals_canceled', desc: '', args: [count]);
  }

  /// `Завершенные сделки`
  String get deals_completed_title {
    return Intl.message('Завершенные сделки', name: 'deals_completed_title', desc: '', args: []);
  }

  /// `Аннулированные сделки`
  String get deals_canceled_title {
    return Intl.message('Аннулированные сделки', name: 'deals_canceled_title', desc: '', args: []);
  }

  /// `Сделка`
  String get deal_title {
    return Intl.message('Сделка', name: 'deal_title', desc: '', args: []);
  }

  /// `Цена с НДС`
  String get deal_price_nds {
    return Intl.message('Цена с НДС', name: 'deal_price_nds', desc: '', args: []);
  }

  /// `Цена без НДС`
  String get deal_price_wnds {
    return Intl.message('Цена без НДС', name: 'deal_price_wnds', desc: '', args: []);
  }

  /// `Объем`
  String get deal_weight {
    return Intl.message('Объем', name: 'deal_weight', desc: '', args: []);
  }

  /// `Срок вывоза`
  String get deal_age {
    return Intl.message('Срок вывоза', name: 'deal_age', desc: '', args: []);
  }

  /// `Cырая клейковина`
  String get deal_kley {
    return Intl.message('Cырая клейковина', name: 'deal_kley', desc: '', args: []);
  }

  /// `Стекловидность`
  String get deal_stekl {
    return Intl.message('Стекловидность', name: 'deal_stekl', desc: '', args: []);
  }

  /// `Натура`
  String get deal_nature {
    return Intl.message('Натура', name: 'deal_nature', desc: '', args: []);
  }

  /// `Влага`
  String get deal_vlaga {
    return Intl.message('Влага', name: 'deal_vlaga', desc: '', args: []);
  }

  /// `Сорная примесь`
  String get deal_primes {
    return Intl.message('Сорная примесь', name: 'deal_primes', desc: '', args: []);
  }

  /// `Проверка качества`
  String get deal_kachestvo {
    return Intl.message('Проверка качества', name: 'deal_kachestvo', desc: '', args: []);
  }

  /// `Сообщим о статусе`
  String get deal_notify_title {
    return Intl.message('Сообщим о статусе', name: 'deal_notify_title', desc: '', args: []);
  }

  /// `Разрешите отправку push-уведомлений, чтобы не пропустить важные шаги сделки`
  String get deal_notify_subtitle {
    return Intl.message(
      'Разрешите отправку push-уведомлений, чтобы не пропустить важные шаги сделки',
      name: 'deal_notify_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Разрешить уведомления`
  String get deal_notify_accept {
    return Intl.message('Разрешить уведомления', name: 'deal_notify_accept', desc: '', args: []);
  }

  /// `6. Сделка закрыта`
  String get deal_close_title {
    return Intl.message('6. Сделка закрыта', name: 'deal_close_title', desc: '', args: []);
  }

  /// `Всего отгружено`
  String get deal_close_total {
    return Intl.message('Всего отгружено', name: 'deal_close_total', desc: '', args: []);
  }

  /// `1. Сделка заключена`
  String get deal_accepted_title {
    return Intl.message('1. Сделка заключена', name: 'deal_accepted_title', desc: '', args: []);
  }

  /// `Документы сформированы`
  String get deal_accepted_docs {
    return Intl.message('Документы сформированы', name: 'deal_accepted_docs', desc: '', args: []);
  }

  /// `3. Оплата`
  String get deal_oplata_title {
    return Intl.message('3. Оплата', name: 'deal_oplata_title', desc: '', args: []);
  }

  /// `Документы подписаны с двух сторон`
  String get deal_oplata_docs {
    return Intl.message('Документы подписаны с двух сторон', name: 'deal_oplata_docs', desc: '', args: []);
  }

  /// `Счет принят в реестр оплаты покупателя`
  String get deal_oplata_schet {
    return Intl.message('Счет принят в реестр оплаты покупателя', name: 'deal_oplata_schet', desc: '', args: []);
  }

  /// `Покупатель произвел оплату`
  String get deal_oplata_pay {
    return Intl.message('Покупатель произвел оплату', name: 'deal_oplata_pay', desc: '', args: []);
  }

  /// `4. Погрузка`
  String get deal_pogruzka_title {
    return Intl.message('4. Погрузка', name: 'deal_pogruzka_title', desc: '', args: []);
  }

  /// `Осталось отгрузить`
  String get deal_pogruzka_left {
    return Intl.message('Осталось отгрузить', name: 'deal_pogruzka_left', desc: '', args: []);
  }

  /// `всего {weight} т`
  String deal_pogruzka_total(Object weight) {
    return Intl.message('всего $weight т', name: 'deal_pogruzka_total', desc: '', args: [weight]);
  }

  /// `Всего отгружено`
  String get deal_swerka_total_weight {
    return Intl.message('Всего отгружено', name: 'deal_swerka_total_weight', desc: '', args: []);
  }

  /// `5. Сверка`
  String get deal_sverka_title {
    return Intl.message('5. Сверка', name: 'deal_sverka_title', desc: '', args: []);
  }

  /// `Ожидаем поступления оплаты`
  String get deal_sverka_notify_title {
    return Intl.message('Ожидаем поступления оплаты', name: 'deal_sverka_notify_title', desc: '', args: []);
  }

  /// `Текст про оплату. Кажется, здесь органично смотрится кнопка, чтобы подтвердить его действия`
  String get deal_sverka_notify_subtitle {
    return Intl.message(
      'Текст про оплату. Кажется, здесь органично смотрится кнопка, чтобы подтвердить его действия',
      name: 'deal_sverka_notify_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Понятно`
  String get deal_sverka_notify_accept {
    return Intl.message('Понятно', name: 'deal_sverka_notify_accept', desc: '', args: []);
  }

  /// `Подтвердите закрытие сделки`
  String get deal_sverka_notify2_title {
    return Intl.message('Подтвердите закрытие сделки', name: 'deal_sverka_notify2_title', desc: '', args: []);
  }

  /// `Текст про оплату. Кажется, здесь органично смотрится кнопка, чтобы подтвердить его действия`
  String get deal_sverka_notify2_subtitle {
    return Intl.message(
      'Текст про оплату. Кажется, здесь органично смотрится кнопка, чтобы подтвердить его действия',
      name: 'deal_sverka_notify2_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Да, подтверждаю`
  String get deal_sverak_notify2_accept {
    return Intl.message('Да, подтверждаю', name: 'deal_sverak_notify2_accept', desc: '', args: []);
  }

  /// `2. Проверка качества`
  String get deal_status_kach {
    return Intl.message('2. Проверка качества', name: 'deal_status_kach', desc: '', args: []);
  }

  /// `Сделка закрыта`
  String get deal_status_closed {
    return Intl.message('Сделка закрыта', name: 'deal_status_closed', desc: '', args: []);
  }

  /// `Формируем реестр машин`
  String get shipment_title1 {
    return Intl.message('Формируем реестр машин', name: 'shipment_title1', desc: '', args: []);
  }

  /// `Погрузка начнется завтра`
  String get shipment_subtitle1 {
    return Intl.message('Погрузка начнется завтра', name: 'shipment_subtitle1', desc: '', args: []);
  }

  /// `Реестр машин сформирован`
  String get shipment_title2 {
    return Intl.message('Реестр машин сформирован', name: 'shipment_title2', desc: '', args: []);
  }

  /// `Погрузка начнется завтра`
  String get shipment_subtitle2 {
    return Intl.message('Погрузка начнется завтра', name: 'shipment_subtitle2', desc: '', args: []);
  }

  /// `Идет погрузка`
  String get shipment_title3 {
    return Intl.message('Идет погрузка', name: 'shipment_title3', desc: '', args: []);
  }

  /// `Погрузка начнется завтра`
  String get shipment_subtitle3 {
    return Intl.message('Погрузка начнется завтра', name: 'shipment_subtitle3', desc: '', args: []);
  }

  /// `{total} т погружено`
  String shipment_title4(Object total) {
    return Intl.message('$total т погружено', name: 'shipment_title4', desc: '', args: [total]);
  }

  /// `Необходимо подтверждение`
  String get shipment_subtitle4 {
    return Intl.message('Необходимо подтверждение', name: 'shipment_subtitle4', desc: '', args: []);
  }

  /// `{total} т погружено`
  String shipment_title5(Object total) {
    return Intl.message('$total т погружено', name: 'shipment_title5', desc: '', args: [total]);
  }

  /// `Погрузка продолжится завтра`
  String get shipment_subtitle5 {
    return Intl.message('Погрузка продолжится завтра', name: 'shipment_subtitle5', desc: '', args: []);
  }

  /// `Факт погрузки`
  String get shipment_fact {
    return Intl.message('Факт погрузки', name: 'shipment_fact', desc: '', args: []);
  }

  /// `План погрузки списком`
  String get shipment_plan {
    return Intl.message('План погрузки списком', name: 'shipment_plan', desc: '', args: []);
  }

  /// `Отправить через...`
  String get shipment_send {
    return Intl.message('Отправить через...', name: 'shipment_send', desc: '', args: []);
  }

  /// `Реестр машин списком`
  String get shipment_registry {
    return Intl.message('Реестр машин списком', name: 'shipment_registry', desc: '', args: []);
  }

  /// `Скоро здесь будут номера машин `
  String get shipment_await {
    return Intl.message('Скоро здесь будут номера машин ', name: 'shipment_await', desc: '', args: []);
  }

  /// `Погружено за день:`
  String get shipment_otrg_day {
    return Intl.message('Погружено за день:', name: 'shipment_otrg_day', desc: '', args: []);
  }

  /// `Закрывающие документы по текущему реестру будут сформированы автоматически.`
  String get shipment_close_docs {
    return Intl.message(
      'Закрывающие документы по текущему реестру будут сформированы автоматически.',
      name: 'shipment_close_docs',
      desc: '',
      args: [],
    );
  }

  /// `Подтверждаю погрузку`
  String get shipment_accept {
    return Intl.message('Подтверждаю погрузку', name: 'shipment_accept', desc: '', args: []);
  }

  /// `Нет, обсудить проблему`
  String get shipment_decline {
    return Intl.message('Нет, обсудить проблему', name: 'shipment_decline', desc: '', args: []);
  }

  /// `Нажимая «Подтверждаю погрузку», вы принимаете`
  String get shipment_offert {
    return Intl.message('Нажимая «Подтверждаю погрузку», вы принимаете', name: 'shipment_offert', desc: '', args: []);
  }

  /// `условия оферты`
  String get shipment_offert_accept {
    return Intl.message('условия оферты', name: 'shipment_offert_accept', desc: '', args: []);
  }

  /// `Планируется к погрузке`
  String get shipment_plane {
    return Intl.message('Планируется к погрузке', name: 'shipment_plane', desc: '', args: []);
  }

  /// `Назначен специалист на проверку качества`
  String get kach_status1 {
    return Intl.message('Назначен специалист на проверку качества', name: 'kach_status1', desc: '', args: []);
  }

  /// `Назначен специалист на проверку качества по адресу:`
  String get kach_status1_with_address {
    return Intl.message(
      'Назначен специалист на проверку качества по адресу:',
      name: 'kach_status1_with_address',
      desc: '',
      args: [],
    );
  }

  /// `Специалист выехал по адресу места хранения`
  String get kach_status2 {
    return Intl.message('Специалист выехал по адресу места хранения', name: 'kach_status2', desc: '', args: []);
  }

  /// `Специалист отобрал пробы`
  String get kach_status3 {
    return Intl.message('Специалист отобрал пробы', name: 'kach_status3', desc: '', args: []);
  }

  /// `Пробы доставлены в лабораторию`
  String get kach_status4 {
    return Intl.message('Пробы доставлены в лабораторию', name: 'kach_status4', desc: '', args: []);
  }

  /// `Качество соответствует спецификации`
  String get kach_status5 {
    return Intl.message('Качество соответствует спецификации', name: 'kach_status5', desc: '', args: []);
  }

  /// `Качество не соответствует спецификации`
  String get kach_status6 {
    return Intl.message('Качество не соответствует спецификации', name: 'kach_status6', desc: '', args: []);
  }

  /// `Оплата произведена`
  String get sverka_status1 {
    return Intl.message('Оплата произведена', name: 'sverka_status1', desc: '', args: []);
  }

  /// `Документы сформированы`
  String get sverka_status2 {
    return Intl.message('Документы сформированы', name: 'sverka_status2', desc: '', args: []);
  }

  /// `{weight} т`
  String weight(Object weight) {
    return Intl.message('$weight т', name: 'weight', desc: '', args: [weight]);
  }

  /// `{price} руб`
  String price(Object price) {
    return Intl.message('$price руб', name: 'price', desc: '', args: [price]);
  }

  /// `{price} руб/т`
  String price_weight(Object price) {
    return Intl.message('$price руб/т', name: 'price_weight', desc: '', args: [price]);
  }

  /// `{price} руб с НДС`
  String price_nds(Object price) {
    return Intl.message('$price руб с НДС', name: 'price_nds', desc: '', args: [price]);
  }

  /// `{price} руб без НДС`
  String price_wnds(Object price) {
    return Intl.message('$price руб без НДС', name: 'price_wnds', desc: '', args: [price]);
  }

  /// `{days} день`
  String days1(Object days) {
    return Intl.message('$days день', name: 'days1', desc: '', args: [days]);
  }

  /// `{days} дня`
  String days2(Object days) {
    return Intl.message('$days дня', name: 'days2', desc: '', args: [days]);
  }

  /// `{days} дней`
  String days5(Object days) {
    return Intl.message('$days дней', name: 'days5', desc: '', args: [days]);
  }

  /// `Договор`
  String get doc_dogovor {
    return Intl.message('Договор', name: 'doc_dogovor', desc: '', args: []);
  }

  /// `Спецификация`
  String get doc_spec {
    return Intl.message('Спецификация', name: 'doc_spec', desc: '', args: []);
  }

  /// `Платежное поручение`
  String get doc_pay {
    return Intl.message('Платежное поручение', name: 'doc_pay', desc: '', args: []);
  }

  /// `Сертификат качества`
  String get doc_sert_cach {
    return Intl.message('Сертификат качества', name: 'doc_sert_cach', desc: '', args: []);
  }

  /// `Акт сверки`
  String get doc_act_sverka {
    return Intl.message('Акт сверки', name: 'doc_act_sverka', desc: '', args: []);
  }

  /// `Письмо на возврат`
  String get doc_letter_back {
    return Intl.message('Письмо на возврат', name: 'doc_letter_back', desc: '', args: []);
  }

  /// `Книга покупок/продаж`
  String get doc_book_pay {
    return Intl.message('Книга покупок/продаж', name: 'doc_book_pay', desc: '', args: []);
  }

  /// `Реестр машин`
  String get doc_registry_cars {
    return Intl.message('Реестр машин', name: 'doc_registry_cars', desc: '', args: []);
  }

  /// `План погрузки`
  String get doc_plan_pogruzki {
    return Intl.message('План погрузки', name: 'doc_plan_pogruzki', desc: '', args: []);
  }

  /// `Отчет о погруженном товаре`
  String get doc_report_tovar {
    return Intl.message('Отчет о погруженном товаре', name: 'doc_report_tovar', desc: '', args: []);
  }

  /// `УПД`
  String get doc_upd {
    return Intl.message('УПД', name: 'doc_upd', desc: '', args: []);
  }

  /// `Ошибка`
  String get error {
    return Intl.message('Ошибка', name: 'error', desc: '', args: []);
  }

  /// `Что-то пошло не так`
  String get error_descr {
    return Intl.message('Что-то пошло не так', name: 'error_descr', desc: '', args: []);
  }

  /// `Загружаем...`
  String get loading {
    return Intl.message('Загружаем...', name: 'loading', desc: '', args: []);
  }

  /// `осталось`
  String get left {
    return Intl.message('осталось', name: 'left', desc: '', args: []);
  }

  /// `Отмена`
  String get cancel {
    return Intl.message('Отмена', name: 'cancel', desc: '', args: []);
  }

  /// `Повторить`
  String get repeat {
    return Intl.message('Повторить', name: 'repeat', desc: '', args: []);
  }

  /// `Подключить myDSS`
  String get link_to_sdk_title {
    return Intl.message('Подключить myDSS', name: 'link_to_sdk_title', desc: '', args: []);
  }

  /// `Что тут происходит?`
  String get link_to_sdk_whats_going_on {
    return Intl.message('Что тут происходит?', name: 'link_to_sdk_whats_going_on', desc: '', args: []);
  }

  /// `Очень хорошо бы еще дополнительно объяснить что нужно и зачем. Для начала работы и автоматизации работы с документами, вам необходимо подключить myDSS`
  String get link_to_sdk_description {
    return Intl.message(
      'Очень хорошо бы еще дополнительно объяснить что нужно и зачем. Для начала работы и автоматизации работы с документами, вам необходимо подключить myDSS',
      name: 'link_to_sdk_description',
      desc: '',
      args: [],
    );
  }

  /// `Ваше имя`
  String get link_to_sdk_username {
    return Intl.message('Ваше имя', name: 'link_to_sdk_username', desc: '', args: []);
  }

  /// `Название устройства`
  String get link_to_sdk_device {
    return Intl.message('Название устройства', name: 'link_to_sdk_device', desc: '', args: []);
  }

  /// `Подключить`
  String get link_to_sdk_button {
    return Intl.message('Подключить', name: 'link_to_sdk_button', desc: '', args: []);
  }

  /// `Статус подключения SDK`
  String get mydss_installed_title {
    return Intl.message('Статус подключения SDK', name: 'mydss_installed_title', desc: '', args: []);
  }

  /// `Сообщите менеджерам код:`
  String get mydss_installed_alias {
    return Intl.message('Сообщите менеджерам код:', name: 'mydss_installed_alias', desc: '', args: []);
  }

  /// `Подтвердите данные профиля`
  String get mydss_installed_confirm {
    return Intl.message('Подтвердите данные профиля', name: 'mydss_installed_confirm', desc: '', args: []);
  }

  /// `Менеджер оформляет заявку на сертификат, ожидайте информацию о следующих дейяствиях`
  String get mydss_installed_req_wait {
    return Intl.message(
      'Менеджер оформляет заявку на сертификат, ожидайте информацию о следующих дейяствиях',
      name: 'mydss_installed_req_wait',
      desc: '',
      args: [],
    );
  }

  /// `Подпишите запрос на сертификат`
  String get mydss_installed_req_confirm {
    return Intl.message('Подпишите запрос на сертификат', name: 'mydss_installed_req_confirm', desc: '', args: []);
  }

  /// `Обновить`
  String get mydss_installed_btn_refresh {
    return Intl.message('Обновить', name: 'mydss_installed_btn_refresh', desc: '', args: []);
  }

  /// `Проверить данные профиля`
  String get mydss_installed_btn_confirm {
    return Intl.message('Проверить данные профиля', name: 'mydss_installed_btn_confirm', desc: '', args: []);
  }

  /// `Подписать`
  String get mydss_installed_btn_req_confirm {
    return Intl.message('Подписать', name: 'mydss_installed_btn_req_confirm', desc: '', args: []);
  }

  /// `Данные о компании`
  String get company_about {
    return Intl.message('Данные о компании', name: 'company_about', desc: '', args: []);
  }

  /// `Форма налогообложения`
  String get company_tax_system {
    return Intl.message('Форма налогообложения', name: 'company_tax_system', desc: '', args: []);
  }

  /// `Юридический адрес`
  String get company_ul_address {
    return Intl.message('Юридический адрес', name: 'company_ul_address', desc: '', args: []);
  }

  /// `Почтовый адрес`
  String get company_mail_address {
    return Intl.message('Почтовый адрес', name: 'company_mail_address', desc: '', args: []);
  }

  /// `ИНН`
  String get company_inn {
    return Intl.message('ИНН', name: 'company_inn', desc: '', args: []);
  }

  /// `КПП`
  String get company_kpp {
    return Intl.message('КПП', name: 'company_kpp', desc: '', args: []);
  }

  /// `ОГРН`
  String get company_ogrn {
    return Intl.message('ОГРН', name: 'company_ogrn', desc: '', args: []);
  }

  /// `Банк`
  String get company_name_of_bank {
    return Intl.message('Банк', name: 'company_name_of_bank', desc: '', args: []);
  }

  /// `Р/С`
  String get company_payment_account {
    return Intl.message('Р/С', name: 'company_payment_account', desc: '', args: []);
  }

  /// `К/С`
  String get company_correspondent_account {
    return Intl.message('К/С', name: 'company_correspondent_account', desc: '', args: []);
  }

  /// `БИК`
  String get company_bik {
    return Intl.message('БИК', name: 'company_bik', desc: '', args: []);
  }

  /// `Форма регистрации`
  String get company_form {
    return Intl.message('Форма регистрации', name: 'company_form', desc: '', args: []);
  }

  /// `Наименование`
  String get company_title {
    return Intl.message('Наименование', name: 'company_title', desc: '', args: []);
  }

  /// `Нет доступа к хранилищу файлов`
  String get docs_view_no_access {
    return Intl.message('Нет доступа к хранилищу файлов', name: 'docs_view_no_access', desc: '', args: []);
  }

  /// `Ссылка для скачивания документа`
  String get docs_view_share_text {
    return Intl.message('Ссылка для скачивания документа', name: 'docs_view_share_text', desc: '', args: []);
  }

  /// `Загрузка документа`
  String get docs_view_error_message {
    return Intl.message('Загрузка документа', name: 'docs_view_error_message', desc: '', args: []);
  }

  /// `Подробности`
  String get additional {
    return Intl.message('Подробности', name: 'additional', desc: '', args: []);
  }

  /// `Не менее`
  String get range_min {
    return Intl.message('Не менее', name: 'range_min', desc: '', args: []);
  }

  /// `Не более`
  String get range_max {
    return Intl.message('Не более', name: 'range_max', desc: '', args: []);
  }

  /// `Сделка заключена`
  String get status_1 {
    return Intl.message('Сделка заключена', name: 'status_1', desc: '', args: []);
  }

  /// `Проверка качества`
  String get status_2 {
    return Intl.message('Проверка качества', name: 'status_2', desc: '', args: []);
  }

  /// `Оплата`
  String get status_3 {
    return Intl.message('Оплата', name: 'status_3', desc: '', args: []);
  }

  /// `Погрузка`
  String get status_4 {
    return Intl.message('Погрузка', name: 'status_4', desc: '', args: []);
  }

  /// `Погрузка завершена`
  String get status_5 {
    return Intl.message('Погрузка завершена', name: 'status_5', desc: '', args: []);
  }

  /// `Сделка закрыта`
  String get status_6 {
    return Intl.message('Сделка закрыта', name: 'status_6', desc: '', args: []);
  }

  /// `Норма выгрузки`
  String get warehouse_normal_volume {
    return Intl.message('Норма выгрузки', name: 'warehouse_normal_volume', desc: '', args: []);
  }

  /// `Наименование`
  String get warehouse_name {
    return Intl.message('Наименование', name: 'warehouse_name', desc: '', args: []);
  }

  /// `Поиск`
  String get warehouse_search {
    return Intl.message('Поиск', name: 'warehouse_search', desc: '', args: []);
  }

  /// `Адрес`
  String get warehouse_address {
    return Intl.message('Адрес', name: 'warehouse_address', desc: '', args: []);
  }

  /// `Готов к подписанию со стороны продавца`
  String get doc_sign_status_ready_to_sign_provider {
    return Intl.message(
      'Готов к подписанию со стороны продавца',
      name: 'doc_sign_status_ready_to_sign_provider',
      desc: '',
      args: [],
    );
  }

  /// `Готов к подписанию со стороны покупателя`
  String get doc_sign_status_ready_to_sign_customer {
    return Intl.message(
      'Готов к подписанию со стороны покупателя',
      name: 'doc_sign_status_ready_to_sign_customer',
      desc: '',
      args: [],
    );
  }

  /// `Ожидает подписи продавца`
  String get doc_sign_status_waiting_provider {
    return Intl.message('Ожидает подписи продавца', name: 'doc_sign_status_waiting_provider', desc: '', args: []);
  }

  /// `Ожидает подписи покупателя`
  String get doc_sign_status_waiting_customer {
    return Intl.message('Ожидает подписи покупателя', name: 'doc_sign_status_waiting_customer', desc: '', args: []);
  }

  /// `Никем не подписано`
  String get doc_sign_status_nobody {
    return Intl.message('Никем не подписано', name: 'doc_sign_status_nobody', desc: '', args: []);
  }

  /// `Подписано продавцом`
  String get doc_sign_status_provider {
    return Intl.message('Подписано продавцом', name: 'doc_sign_status_provider', desc: '', args: []);
  }

  /// `Подписано покупателем`
  String get doc_sign_status_customer {
    return Intl.message('Подписано покупателем', name: 'doc_sign_status_customer', desc: '', args: []);
  }

  /// `Подписано с двух сторон`
  String get doc_sign_status_both {
    return Intl.message('Подписано с двух сторон', name: 'doc_sign_status_both', desc: '', args: []);
  }

  /// `Ошибка подписи продавцом`
  String get doc_sign_status_error_provider {
    return Intl.message('Ошибка подписи продавцом', name: 'doc_sign_status_error_provider', desc: '', args: []);
  }

  /// `Ошибка подписи покупателем`
  String get doc_sign_status_error_customer {
    return Intl.message('Ошибка подписи покупателем', name: 'doc_sign_status_error_customer', desc: '', args: []);
  }

  /// `Другая ошибка`
  String get doc_sign_status_error {
    return Intl.message('Другая ошибка', name: 'doc_sign_status_error', desc: '', args: []);
  }

  /// `Необходимо выпустить сертификат`
  String get need_certificate {
    return Intl.message('Необходимо выпустить сертификат', name: 'need_certificate', desc: '', args: []);
  }

  /// `Просмотр документа`
  String get view_document {
    return Intl.message('Просмотр документа', name: 'view_document', desc: '', args: []);
  }

  /// `Закрыть`
  String get modal_close {
    return Intl.message('Закрыть', name: 'modal_close', desc: '', args: []);
  }

  /// `Что-то пошло не так...`
  String get modal_something_went_wrong {
    return Intl.message('Что-то пошло не так...', name: 'modal_something_went_wrong', desc: '', args: []);
  }

  /// `При подписании документов произошла ошибка, попробуйте снова`
  String get modal_try_again {
    return Intl.message(
      'При подписании документов произошла ошибка, попробуйте снова',
      name: 'modal_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Активные`
  String get orders_type_active {
    return Intl.message('Активные', name: 'orders_type_active', desc: '', args: []);
  }

  /// `Активных сделок нет`
  String get orders_type_active_not {
    return Intl.message('Активных сделок нет', name: 'orders_type_active_not', desc: '', args: []);
  }

  /// `Завершенные`
  String get orders_type_completed {
    return Intl.message('Завершенные', name: 'orders_type_completed', desc: '', args: []);
  }

  /// `Завершенных сделок нет`
  String get orders_type_completed_not {
    return Intl.message('Завершенных сделок нет', name: 'orders_type_completed_not', desc: '', args: []);
  }

  /// `Исторические`
  String get orders_type_history {
    return Intl.message('Исторические', name: 'orders_type_history', desc: '', args: []);
  }

  /// `Исторических сделок нет`
  String get orders_type_history_not {
    return Intl.message('Исторических сделок нет', name: 'orders_type_history_not', desc: '', args: []);
  }

  /// `Аннулированные`
  String get orders_type_cancelled {
    return Intl.message('Аннулированные', name: 'orders_type_cancelled', desc: '', args: []);
  }

  /// `Аннулированных сделок нет`
  String get orders_type_cancelled_not {
    return Intl.message('Аннулированных сделок нет', name: 'orders_type_cancelled_not', desc: '', args: []);
  }

  /// `Фильтр`
  String get orders_showcase_filter_title {
    return Intl.message('Фильтр', name: 'orders_showcase_filter_title', desc: '', args: []);
  }

  /// `Здесь Вы можете отфильтровать сделки по типу: активные, завершенные или аннулированые`
  String get orders_showcase_filter_discription {
    return Intl.message(
      'Здесь Вы можете отфильтровать сделки по типу: активные, завершенные или аннулированые',
      name: 'orders_showcase_filter_discription',
      desc: '',
      args: [],
    );
  }

  /// `Вы так же можете перемещаться между экранами с разными типами сделок с помощью свайпа влево/вправо`
  String get orders_showcase_filter_swipe {
    return Intl.message(
      'Вы так же можете перемещаться между экранами с разными типами сделок с помощью свайпа влево/вправо',
      name: 'orders_showcase_filter_swipe',
      desc: '',
      args: [],
    );
  }

  /// `Компания`
  String get history_orders_companyName {
    return Intl.message('Компания', name: 'history_orders_companyName', desc: '', args: []);
  }

  /// `Спецификация`
  String get history_orders_specName {
    return Intl.message('Спецификация', name: 'history_orders_specName', desc: '', args: []);
  }

  /// `Статус`
  String get history_orders_status {
    return Intl.message('Статус', name: 'history_orders_status', desc: '', args: []);
  }

  /// `Контракт`
  String get history_orders_contract {
    return Intl.message('Контракт', name: 'history_orders_contract', desc: '', args: []);
  }

  /// `Дата`
  String get history_orders_startDate {
    return Intl.message('Дата', name: 'history_orders_startDate', desc: '', args: []);
  }

  /// `Продукт`
  String get history_orders_productName {
    return Intl.message('Продукт', name: 'history_orders_productName', desc: '', args: []);
  }

  /// `Общий объём, тонн`
  String get history_orders_totalVolume {
    return Intl.message('Общий объём, тонн', name: 'history_orders_totalVolume', desc: '', args: []);
  }

  /// `Отгружено, тонн`
  String get history_orders_realVolume {
    return Intl.message('Отгружено, тонн', name: 'history_orders_realVolume', desc: '', args: []);
  }

  /// `Оплачено, тонн`
  String get history_orders_payedVolume {
    return Intl.message('Оплачено, тонн', name: 'history_orders_payedVolume', desc: '', args: []);
  }

  /// `Цена, руб/тонна`
  String get history_orders_price {
    return Intl.message('Цена, руб/тонна', name: 'history_orders_price', desc: '', args: []);
  }

  /// `Не доставлено, тонн`
  String get history_orders_leftToDeliverVolume {
    return Intl.message('Не доставлено, тонн', name: 'history_orders_leftToDeliverVolume', desc: '', args: []);
  }

  /// `Не оплачено, тонн`
  String get history_orders_unpaidVolume {
    return Intl.message('Не оплачено, тонн', name: 'history_orders_unpaidVolume', desc: '', args: []);
  }

  /// `Условия поставки`
  String get history_orders_basis {
    return Intl.message('Условия поставки', name: 'history_orders_basis', desc: '', args: []);
  }

  /// `Забыли пароль?`
  String get forgot_password_forget {
    return Intl.message('Забыли пароль?', name: 'forgot_password_forget', desc: '', args: []);
  }

  /// `Укажите Вашу электронну почту`
  String get forgot_password_email_title {
    return Intl.message('Укажите Вашу электронну почту', name: 'forgot_password_email_title', desc: '', args: []);
  }

  /// `По указанному адресу придёт письмо для восстановления пароля`
  String get forgot_password_email_description {
    return Intl.message(
      'По указанному адресу придёт письмо для восстановления пароля',
      name: 'forgot_password_email_description',
      desc: '',
      args: [],
    );
  }

  /// `Отправить`
  String get forgot_password_send_email {
    return Intl.message('Отправить', name: 'forgot_password_send_email', desc: '', args: []);
  }

  /// `Введите токен`
  String get forgot_password_enter_token {
    return Intl.message('Введите токен', name: 'forgot_password_enter_token', desc: '', args: []);
  }

  /// `Пароли не совпадают`
  String get forgot_password_dont_match {
    return Intl.message('Пароли не совпадают', name: 'forgot_password_dont_match', desc: '', args: []);
  }

  /// `Введите новый пароль`
  String get forgot_password_enter_new_password {
    return Intl.message('Введите новый пароль', name: 'forgot_password_enter_new_password', desc: '', args: []);
  }

  /// `Пароль меньше 8 символов`
  String get forgot_password_less_8_characters {
    return Intl.message('Пароль меньше 8 символов', name: 'forgot_password_less_8_characters', desc: '', args: []);
  }

  /// `Укажите токен из почты и новый пароль`
  String get forgot_password_enter_token_and_new_password {
    return Intl.message(
      'Укажите токен из почты и новый пароль',
      name: 'forgot_password_enter_token_and_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Пароль должен состоять минимум из 8 символов и не быть простым`
  String get forgot_password_less_8_and_not_single {
    return Intl.message(
      'Пароль должен состоять минимум из 8 символов и не быть простым',
      name: 'forgot_password_less_8_and_not_single',
      desc: '',
      args: [],
    );
  }

  /// `Токен`
  String get forgot_password_token {
    return Intl.message('Токен', name: 'forgot_password_token', desc: '', args: []);
  }

  /// `Новый пароль`
  String get forgot_password_new_password {
    return Intl.message('Новый пароль', name: 'forgot_password_new_password', desc: '', args: []);
  }

  /// `Повторите новый пароль`
  String get forgot_password_repeat_new_password {
    return Intl.message('Повторите новый пароль', name: 'forgot_password_repeat_new_password', desc: '', args: []);
  }

  /// `Авторизуйтесь с новым паролем`
  String get forgot_password_auth_with_new_password {
    return Intl.message(
      'Авторизуйтесь с новым паролем',
      name: 'forgot_password_auth_with_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get forgot_password_close {
    return Intl.message('Закрыть', name: 'forgot_password_close', desc: '', args: []);
  }

  /// `Данные отправляются...`
  String get forgot_password_data_is_being_sent {
    return Intl.message('Данные отправляются...', name: 'forgot_password_data_is_being_sent', desc: '', args: []);
  }

  /// `Пароль изменён`
  String get forgot_password_changed {
    return Intl.message('Пароль изменён', name: 'forgot_password_changed', desc: '', args: []);
  }

  /// `Ваша почта`
  String get forgot_password_your_email {
    return Intl.message('Ваша почта', name: 'forgot_password_your_email', desc: '', args: []);
  }

  /// `Все цены указаны без НДС, на воротах порта`
  String get price_screen_subtitle {
    return Intl.message(
      'Все цены указаны без НДС, на воротах порта',
      name: 'price_screen_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Написать в Whatsapp`
  String get price_screen_write_whatsapp {
    return Intl.message('Написать в Whatsapp', name: 'price_screen_write_whatsapp', desc: '', args: []);
  }

  /// `Бонус до 100 000₽`
  String get bottom_sheet_promo_title {
    return Intl.message('Бонус до 100 000₽', name: 'bottom_sheet_promo_title', desc: '', args: []);
  }

  /// `при оформлении первой сделки с нами`
  String get bottom_sheet_promo_subtitle {
    return Intl.message('при оформлении первой сделки с нами', name: 'bottom_sheet_promo_subtitle', desc: '', args: []);
  }

  /// `Зарегистрироваться`
  String get bottom_sheet_promo_registration {
    return Intl.message('Зарегистрироваться', name: 'bottom_sheet_promo_registration', desc: '', args: []);
  }

  /// `Если вы не нашли культуру, которую хотели бы продать — `
  String get price_screen_write_me_description {
    return Intl.message(
      'Если вы не нашли культуру, которую хотели бы продать — ',
      name: 'price_screen_write_me_description',
      desc: '',
      args: [],
    );
  }

  /// `напишите нам`
  String get price_screen_write_me {
    return Intl.message('напишите нам', name: 'price_screen_write_me', desc: '', args: []);
  }

  /// `Торги`
  String get bid {
    return Intl.message('Торги', name: 'bid', desc: '', args: []);
  }

  /// `новых сообщений`
  String get new_messages_bid {
    return Intl.message('новых сообщений', name: 'new_messages_bid', desc: '', args: []);
  }

  /// `новое сообщение`
  String get new_message_bid {
    return Intl.message('новое сообщение', name: 'new_message_bid', desc: '', args: []);
  }

  /// `Новых сообщений нет`
  String get not_new_message_bid {
    return Intl.message('Новых сообщений нет', name: 'not_new_message_bid', desc: '', args: []);
  }

  /// `Активные`
  String get active_bid {
    return Intl.message('Активные', name: 'active_bid', desc: '', args: []);
  }

  /// `История`
  String get history_bid {
    return Intl.message('История', name: 'history_bid', desc: '', args: []);
  }

  /// `Ваше сообщение`
  String get your_message_bid {
    return Intl.message('Ваше сообщение', name: 'your_message_bid', desc: '', args: []);
  }

  /// `тонн`
  String get tonn_bid {
    return Intl.message('тонн', name: 'tonn_bid', desc: '', args: []);
  }

  /// `Принять цену покупателя`
  String get take_price_buyer_bid {
    return Intl.message('Принять цену покупателя', name: 'take_price_buyer_bid', desc: '', args: []);
  }

  /// `Изменить вашу цену`
  String get change_price_provider_bid {
    return Intl.message('Изменить вашу цену', name: 'change_price_provider_bid', desc: '', args: []);
  }

  /// `В любой момент вы можете принять предложение покупателя или изменить своё предложение`
  String get description_bid {
    return Intl.message(
      'В любой момент вы можете принять предложение покупателя или изменить своё предложение',
      name: 'description_bid',
      desc: '',
      args: [],
    );
  }

  /// `Время на подписание сделки истекло, начните новый торг, если хотите попробовать договориться заново.`
  String get description2_bid {
    return Intl.message(
      'Время на подписание сделки истекло, начните новый торг, если хотите попробовать договориться заново.',
      name: 'description2_bid',
      desc: '',
      args: [],
    );
  }

  /// `Ваше предложение`
  String get your_offer_bid {
    return Intl.message('Ваше предложение', name: 'your_offer_bid', desc: '', args: []);
  }

  /// `Новое предложение`
  String get new_offer_bid {
    return Intl.message('Новое предложение', name: 'new_offer_bid', desc: '', args: []);
  }

  /// `Принять`
  String get take_bid {
    return Intl.message('Принять', name: 'take_bid', desc: '', args: []);
  }

  /// `Цена без НДС`
  String get price_wthout_nds_bid {
    return Intl.message('Цена без НДС', name: 'price_wthout_nds_bid', desc: '', args: []);
  }

  /// `Объём`
  String get volume_bid {
    return Intl.message('Объём', name: 'volume_bid', desc: '', args: []);
  }

  /// `Открыть сделку`
  String get open_offer_bid {
    return Intl.message('Открыть сделку', name: 'open_offer_bid', desc: '', args: []);
  }

  /// `Вы готовы принять предложение покупателя`
  String get you_ready_take_offer_bid {
    return Intl.message(
      'Вы готовы принять предложение покупателя',
      name: 'you_ready_take_offer_bid',
      desc: '',
      args: [],
    );
  }

  /// `Покупатель принял ваше предложение`
  String get buyer_take_your_offer_bid {
    return Intl.message('Покупатель принял ваше предложение', name: 'buyer_take_your_offer_bid', desc: '', args: []);
  }

  /// `Ваша очередь теперь принять сделку`
  String get you_must_take_offer_bid {
    return Intl.message('Ваша очередь теперь принять сделку', name: 'you_must_take_offer_bid', desc: '', args: []);
  }

  /// `Принять сделку`
  String get take_offer_bid {
    return Intl.message('Принять сделку', name: 'take_offer_bid', desc: '', args: []);
  }

  /// `руб с НДС`
  String get rub_with_nds_bid {
    return Intl.message('руб с НДС', name: 'rub_with_nds_bid', desc: '', args: []);
  }

  /// `дней`
  String get days_bid {
    return Intl.message('дней', name: 'days_bid', desc: '', args: []);
  }

  /// `Обновить цену`
  String get update_price_bid {
    return Intl.message('Обновить цену', name: 'update_price_bid', desc: '', args: []);
  }

  /// `Войти или создать аккаунт`
  String get signin_reg_pthone_auth {
    return Intl.message('Войти или создать аккаунт', name: 'signin_reg_pthone_auth', desc: '', args: []);
  }

  /// `Подтверждение телефона`
  String get confirm_phone_pthone_auth {
    return Intl.message('Подтверждение телефона', name: 'confirm_phone_pthone_auth', desc: '', args: []);
  }

  /// `Добро пожаловать!`
  String get wellcome_phone_auth {
    return Intl.message('Добро пожаловать!', name: 'wellcome_phone_auth', desc: '', args: []);
  }

  /// `Ваш номер телефона`
  String get your_phone_phone_auth {
    return Intl.message('Ваш номер телефона', name: 'your_phone_phone_auth', desc: '', args: []);
  }

  /// `Получить код`
  String get take_code_phone_auth {
    return Intl.message('Получить код', name: 'take_code_phone_auth', desc: '', args: []);
  }

  /// `Выслать новый код через:`
  String get send_new_code_phone_auth {
    return Intl.message('Выслать новый код через:', name: 'send_new_code_phone_auth', desc: '', args: []);
  }

  /// `Выслать новый код`
  String get send_new_code2_phone_auth {
    return Intl.message('Выслать новый код', name: 'send_new_code2_phone_auth', desc: '', args: []);
  }

  /// `Я соглашаюсь с `
  String get i_agree_phone_auth {
    return Intl.message('Я соглашаюсь с ', name: 'i_agree_phone_auth', desc: '', args: []);
  }

  /// `Политикой конфеденциальности, `
  String get policy_confidation_phone_auth {
    return Intl.message('Политикой конфеденциальности, ', name: 'policy_confidation_phone_auth', desc: '', args: []);
  }

  /// `Лицензионным договором,`
  String get licanze_order_phone_auth {
    return Intl.message('Лицензионным договором,', name: 'licanze_order_phone_auth', desc: '', args: []);
  }

  /// `Обработкой персональных данных`
  String get privacy_policy_phone_auth {
    return Intl.message('Обработкой персональных данных', name: 'privacy_policy_phone_auth', desc: '', args: []);
  }

  /// `Название или ИНН вашего предприятия`
  String get name_inn_phone_auth {
    return Intl.message('Название или ИНН вашего предприятия', name: 'name_inn_phone_auth', desc: '', args: []);
  }

  /// `Регистрация`
  String get registration_phone_auth {
    return Intl.message('Регистрация', name: 'registration_phone_auth', desc: '', args: []);
  }

  /// `Необходима проверка пользователя`
  String get check_user_title_status_profile {
    return Intl.message(
      'Необходима проверка пользователя',
      name: 'check_user_title_status_profile',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь проверен`
  String get ok_user_title_status_profile {
    return Intl.message('Пользователь проверен', name: 'ok_user_title_status_profile', desc: '', args: []);
  }

  /// `Для доступа к статусам сделок и их истории, подтвердите, что вы являетесь представителем компании`
  String get check_user_description_status_profile {
    return Intl.message(
      'Для доступа к статусам сделок и их истории, подтвердите, что вы являетесь представителем компании',
      name: 'check_user_description_status_profile',
      desc: '',
      args: [],
    );
  }

  /// `Необходима аккредитация компании`
  String get check_accredit_title_status_profile {
    return Intl.message(
      'Необходима аккредитация компании',
      name: 'check_accredit_title_status_profile',
      desc: '',
      args: [],
    );
  }

  /// `Компания аккредитована`
  String get ok_accredit_title_status_profile {
    return Intl.message('Компания аккредитована', name: 'ok_accredit_title_status_profile', desc: '', args: []);
  }

  /// `Представьте документы компании для проверки вашего юрлица`
  String get check_accredit_description_status_profile {
    return Intl.message(
      'Представьте документы компании для проверки вашего юрлица',
      name: 'check_accredit_description_status_profile',
      desc: '',
      args: [],
    );
  }

  /// `Подписание документов`
  String get check_sign_title_status_profile {
    return Intl.message('Подписание документов', name: 'check_sign_title_status_profile', desc: '', args: []);
  }

  /// `Для начала работы и автоматизации работы с документами, вам необходимо подключить SDK`
  String get check_sign_description_status_profile {
    return Intl.message(
      'Для начала работы и автоматизации работы с документами, вам необходимо подключить SDK',
      name: 'check_sign_description_status_profile',
      desc: '',
      args: [],
    );
  }

  /// `Проверка пользователя`
  String get check_user_title_status_profile_bottomsheet {
    return Intl.message(
      'Проверка пользователя',
      name: 'check_user_title_status_profile_bottomsheet',
      desc: '',
      args: [],
    );
  }

  /// `Чтобы мы могли удостовериться, что вы действительно являетесь представителем компании, вам нужно распечатать, подписать и отправить нам заявление из формы по адресу`
  String get check_user_descrip_status_profile_bottomsheet {
    return Intl.message(
      'Чтобы мы могли удостовериться, что вы действительно являетесь представителем компании, вам нужно распечатать, подписать и отправить нам заявление из формы по адресу',
      name: 'check_user_descrip_status_profile_bottomsheet',
      desc: '',
      args: [],
    );
  }

  /// `Ваше имя`
  String get your_name_status_profile_bottomsheet {
    return Intl.message('Ваше имя', name: 'your_name_status_profile_bottomsheet', desc: '', args: []);
  }

  /// `Ваша электронная почта`
  String get you_do_status_profile_bottomsheet {
    return Intl.message('Ваша электронная почта', name: 'you_do_status_profile_bottomsheet', desc: '', args: []);
  }

  /// `Внимание`
  String get atantion_delete_acc {
    return Intl.message('Внимание', name: 'atantion_delete_acc', desc: '', args: []);
  }

  /// `Да`
  String get yes_delete_acc {
    return Intl.message('Да', name: 'yes_delete_acc', desc: '', args: []);
  }

  /// `Нет`
  String get no_delete_acc {
    return Intl.message('Нет', name: 'no_delete_acc', desc: '', args: []);
  }

  /// `Вы действительно хотите удалить свой аккаунт полностью?`
  String get description_delete_acc {
    return Intl.message(
      'Вы действительно хотите удалить свой аккаунт полностью?',
      name: 'description_delete_acc',
      desc: '',
      args: [],
    );
  }

  /// `Удалить аккаунт`
  String get delete_acc {
    return Intl.message('Удалить аккаунт', name: 'delete_acc', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'ru')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
