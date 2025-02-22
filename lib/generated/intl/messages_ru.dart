// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(days) => "${days} день";

  static String m1(days) => "${days} дня";

  static String m2(days) => "${days} дней";

  static String m3(weight) => "всего ${weight} т";

  static String m4(count) => "Аннулированные - ${count}";

  static String m5(count) => "Завершенные - ${count}";

  static String m6(price) => "${price} руб";

  static String m7(price) => "${price} руб с НДС";

  static String m8(price) => "${price} руб/т";

  static String m9(price) => "${price} руб без НДС";

  static String m10(version) => "Версия ${version}";

  static String m11(total) => "${total} т погружено";

  static String m12(total) => "${total} т погружено";

  static String m13(weight) => "${weight} т";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "active_bid": MessageLookupByLibrary.simpleMessage("Активные"),
        "additional": MessageLookupByLibrary.simpleMessage("Подробности"),
        "analitics": MessageLookupByLibrary.simpleMessage("Аналитика"),
        "atantion_delete_acc": MessageLookupByLibrary.simpleMessage("Внимание"),
        "auth_btn": MessageLookupByLibrary.simpleMessage("Войти"),
        "auth_error": MessageLookupByLibrary.simpleMessage(
            "Что-то пошло не так. Пожалуйста, попробуйте напечатать заново"),
        "auth_login": MessageLookupByLibrary.simpleMessage("Ваш логин"),
        "auth_password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "auth_subtitle": MessageLookupByLibrary.simpleMessage(
            "Закупка зерновых культур по всей России\n Покупка и продажа аграрной продукции"),
        "auth_title": MessageLookupByLibrary.simpleMessage("Silk"),
        "bid": MessageLookupByLibrary.simpleMessage("Торги"),
        "bottom_sheet_promo_registration":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "bottom_sheet_promo_subtitle": MessageLookupByLibrary.simpleMessage(
            "при оформлении первой сделки с нами"),
        "bottom_sheet_promo_title":
            MessageLookupByLibrary.simpleMessage("Бонус до 100 000₽"),
        "buyer_take_your_offer_bid": MessageLookupByLibrary.simpleMessage(
            "Покупатель принял ваше предложение"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "change_price_provider_bid":
            MessageLookupByLibrary.simpleMessage("Изменить вашу цену"),
        "check_accredit_description_status_profile":
            MessageLookupByLibrary.simpleMessage(
                "Представьте документы компании для проверки вашего юрлица"),
        "check_accredit_title_status_profile":
            MessageLookupByLibrary.simpleMessage(
                "Необходима аккредитация компании"),
        "check_sign_description_status_profile":
            MessageLookupByLibrary.simpleMessage(
                "Для начала работы и автоматизации работы с документами, вам необходимо подключить SDK"),
        "check_sign_title_status_profile":
            MessageLookupByLibrary.simpleMessage("Подписание документов"),
        "check_user_descrip_status_profile_bottomsheet":
            MessageLookupByLibrary.simpleMessage(
                "Чтобы мы могли удостовериться, что вы действительно являетесь представителем компании, вам нужно распечатать, подписать и отправить нам заявление из формы по адресу"),
        "check_user_description_status_profile":
            MessageLookupByLibrary.simpleMessage(
                "Для доступа к статусам сделок и их истории, подтвердите, что вы являетесь представителем компании"),
        "check_user_title_status_profile": MessageLookupByLibrary.simpleMessage(
            "Необходима проверка пользователя"),
        "check_user_title_status_profile_bottomsheet":
            MessageLookupByLibrary.simpleMessage("Проверка пользователя"),
        "company_about":
            MessageLookupByLibrary.simpleMessage("Данные о компании"),
        "company_bik": MessageLookupByLibrary.simpleMessage("БИК"),
        "company_correspondent_account":
            MessageLookupByLibrary.simpleMessage("К/С"),
        "company_form":
            MessageLookupByLibrary.simpleMessage("Форма регистрации"),
        "company_inn": MessageLookupByLibrary.simpleMessage("ИНН"),
        "company_kpp": MessageLookupByLibrary.simpleMessage("КПП"),
        "company_mail_address":
            MessageLookupByLibrary.simpleMessage("Почтовый адрес"),
        "company_name_of_bank": MessageLookupByLibrary.simpleMessage("Банк"),
        "company_ogrn": MessageLookupByLibrary.simpleMessage("ОГРН"),
        "company_payment_account": MessageLookupByLibrary.simpleMessage("Р/С"),
        "company_tax_system":
            MessageLookupByLibrary.simpleMessage("Форма налогообложения"),
        "company_title": MessageLookupByLibrary.simpleMessage("Наименование"),
        "company_ul_address":
            MessageLookupByLibrary.simpleMessage("Юридический адрес"),
        "confirm_phone_pthone_auth":
            MessageLookupByLibrary.simpleMessage("Подтверждение телефона"),
        "days1": m0,
        "days2": m1,
        "days5": m2,
        "days_bid": MessageLookupByLibrary.simpleMessage("дней"),
        "deal_accepted_docs":
            MessageLookupByLibrary.simpleMessage("Документы сформированы"),
        "deal_accepted_title":
            MessageLookupByLibrary.simpleMessage("1. Сделка заключена"),
        "deal_age": MessageLookupByLibrary.simpleMessage("Срок вывоза"),
        "deal_close_title":
            MessageLookupByLibrary.simpleMessage("6. Сделка закрыта"),
        "deal_close_total":
            MessageLookupByLibrary.simpleMessage("Всего отгружено"),
        "deal_kachestvo":
            MessageLookupByLibrary.simpleMessage("Проверка качества"),
        "deal_kley": MessageLookupByLibrary.simpleMessage("Cырая клейковина"),
        "deal_nature": MessageLookupByLibrary.simpleMessage("Натура"),
        "deal_notify_accept":
            MessageLookupByLibrary.simpleMessage("Разрешить уведомления"),
        "deal_notify_subtitle": MessageLookupByLibrary.simpleMessage(
            "Разрешите отправку push-уведомлений, чтобы не пропустить важные шаги сделки"),
        "deal_notify_title":
            MessageLookupByLibrary.simpleMessage("Сообщим о статусе"),
        "deal_oplata_docs": MessageLookupByLibrary.simpleMessage(
            "Документы подписаны с двух сторон"),
        "deal_oplata_pay":
            MessageLookupByLibrary.simpleMessage("Покупатель произвел оплату"),
        "deal_oplata_schet": MessageLookupByLibrary.simpleMessage(
            "Счет принят в реестр оплаты покупателя"),
        "deal_oplata_title": MessageLookupByLibrary.simpleMessage("3. Оплата"),
        "deal_pogruzka_left":
            MessageLookupByLibrary.simpleMessage("Осталось отгрузить"),
        "deal_pogruzka_title":
            MessageLookupByLibrary.simpleMessage("4. Погрузка"),
        "deal_pogruzka_total": m3,
        "deal_price_nds": MessageLookupByLibrary.simpleMessage("Цена с НДС"),
        "deal_price_wnds": MessageLookupByLibrary.simpleMessage("Цена без НДС"),
        "deal_primes": MessageLookupByLibrary.simpleMessage("Сорная примесь"),
        "deal_status_closed":
            MessageLookupByLibrary.simpleMessage("Сделка закрыта"),
        "deal_status_kach":
            MessageLookupByLibrary.simpleMessage("2. Проверка качества"),
        "deal_stekl": MessageLookupByLibrary.simpleMessage("Стекловидность"),
        "deal_sverak_notify2_accept":
            MessageLookupByLibrary.simpleMessage("Да, подтверждаю"),
        "deal_sverka_notify2_subtitle": MessageLookupByLibrary.simpleMessage(
            "Текст про оплату. Кажется, здесь органично смотрится кнопка, чтобы подтвердить его действия"),
        "deal_sverka_notify2_title":
            MessageLookupByLibrary.simpleMessage("Подтвердите закрытие сделки"),
        "deal_sverka_notify_accept":
            MessageLookupByLibrary.simpleMessage("Понятно"),
        "deal_sverka_notify_subtitle": MessageLookupByLibrary.simpleMessage(
            "Текст про оплату. Кажется, здесь органично смотрится кнопка, чтобы подтвердить его действия"),
        "deal_sverka_notify_title":
            MessageLookupByLibrary.simpleMessage("Ожидаем поступления оплаты"),
        "deal_sverka_title": MessageLookupByLibrary.simpleMessage("5. Сверка"),
        "deal_swerka_total_weight":
            MessageLookupByLibrary.simpleMessage("Всего отгружено"),
        "deal_title": MessageLookupByLibrary.simpleMessage("Сделка"),
        "deal_vlaga": MessageLookupByLibrary.simpleMessage("Влага"),
        "deal_weight": MessageLookupByLibrary.simpleMessage("Объем"),
        "deals": MessageLookupByLibrary.simpleMessage("Сделки"),
        "deals_canceled": m4,
        "deals_canceled_title":
            MessageLookupByLibrary.simpleMessage("Аннулированные сделки"),
        "deals_completed": m5,
        "deals_completed_title":
            MessageLookupByLibrary.simpleMessage("Завершенные сделки"),
        "deals_subtitle": MessageLookupByLibrary.simpleMessage(
            "Цена «на колесах» без НДС (с погрузкой в машину)"),
        "deals_title": MessageLookupByLibrary.simpleMessage("Сделки"),
        "delete_acc": MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "description2_bid": MessageLookupByLibrary.simpleMessage(
            "Время на подписание сделки истекло, начните новый торг, если хотите попробовать договориться заново."),
        "description_bid": MessageLookupByLibrary.simpleMessage(
            "В любой момент вы можете принять предложение покупателя или изменить своё предложение"),
        "description_delete_acc": MessageLookupByLibrary.simpleMessage(
            "Вы действительно хотите удалить свой аккаунт полностью?"),
        "doc_act_sverka": MessageLookupByLibrary.simpleMessage("Акт сверки"),
        "doc_book_pay":
            MessageLookupByLibrary.simpleMessage("Книга покупок/продаж"),
        "doc_dogovor": MessageLookupByLibrary.simpleMessage("Договор"),
        "doc_letter_back":
            MessageLookupByLibrary.simpleMessage("Письмо на возврат"),
        "doc_pay": MessageLookupByLibrary.simpleMessage("Платежное поручение"),
        "doc_plan_pogruzki":
            MessageLookupByLibrary.simpleMessage("План погрузки"),
        "doc_registry_cars":
            MessageLookupByLibrary.simpleMessage("Реестр машин"),
        "doc_report_tovar":
            MessageLookupByLibrary.simpleMessage("Отчет о погруженном товаре"),
        "doc_sert_cach":
            MessageLookupByLibrary.simpleMessage("Сертификат качества"),
        "doc_sign_status_both":
            MessageLookupByLibrary.simpleMessage("Подписано с двух сторон"),
        "doc_sign_status_customer":
            MessageLookupByLibrary.simpleMessage("Подписано покупателем"),
        "doc_sign_status_error":
            MessageLookupByLibrary.simpleMessage("Другая ошибка"),
        "doc_sign_status_error_customer":
            MessageLookupByLibrary.simpleMessage("Ошибка подписи покупателем"),
        "doc_sign_status_error_provider":
            MessageLookupByLibrary.simpleMessage("Ошибка подписи продавцом"),
        "doc_sign_status_nobody":
            MessageLookupByLibrary.simpleMessage("Никем не подписано"),
        "doc_sign_status_provider":
            MessageLookupByLibrary.simpleMessage("Подписано продавцом"),
        "doc_sign_status_ready_to_sign_customer":
            MessageLookupByLibrary.simpleMessage(
                "Готов к подписанию со стороны покупателя"),
        "doc_sign_status_ready_to_sign_provider":
            MessageLookupByLibrary.simpleMessage(
                "Готов к подписанию со стороны продавца"),
        "doc_sign_status_waiting_customer":
            MessageLookupByLibrary.simpleMessage("Ожидает подписи покупателя"),
        "doc_sign_status_waiting_provider":
            MessageLookupByLibrary.simpleMessage("Ожидает подписи продавца"),
        "doc_spec": MessageLookupByLibrary.simpleMessage("Спецификация"),
        "doc_upd": MessageLookupByLibrary.simpleMessage("УПД"),
        "docs_view_error_message":
            MessageLookupByLibrary.simpleMessage("Загрузка документа"),
        "docs_view_no_access": MessageLookupByLibrary.simpleMessage(
            "Нет доступа к хранилищу файлов"),
        "docs_view_share_text": MessageLookupByLibrary.simpleMessage(
            "Ссылка для скачивания документа"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "error_descr":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "forgot_password_auth_with_new_password":
            MessageLookupByLibrary.simpleMessage(
                "Авторизуйтесь с новым паролем"),
        "forgot_password_changed":
            MessageLookupByLibrary.simpleMessage("Пароль изменён"),
        "forgot_password_close":
            MessageLookupByLibrary.simpleMessage("Закрыть"),
        "forgot_password_data_is_being_sent":
            MessageLookupByLibrary.simpleMessage("Данные отправляются..."),
        "forgot_password_dont_match":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
        "forgot_password_email_description":
            MessageLookupByLibrary.simpleMessage(
                "По указанному адресу придёт письмо для восстановления пароля"),
        "forgot_password_email_title": MessageLookupByLibrary.simpleMessage(
            "Укажите Вашу электронну почту"),
        "forgot_password_enter_new_password":
            MessageLookupByLibrary.simpleMessage("Введите новый пароль"),
        "forgot_password_enter_token":
            MessageLookupByLibrary.simpleMessage("Введите токен"),
        "forgot_password_enter_token_and_new_password":
            MessageLookupByLibrary.simpleMessage(
                "Укажите токен из почты и новый пароль"),
        "forgot_password_forget":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "forgot_password_less_8_and_not_single":
            MessageLookupByLibrary.simpleMessage(
                "Пароль должен состоять минимум из 8 символов и не быть простым"),
        "forgot_password_less_8_characters":
            MessageLookupByLibrary.simpleMessage("Пароль меньше 8 символов"),
        "forgot_password_new_password":
            MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "forgot_password_repeat_new_password":
            MessageLookupByLibrary.simpleMessage("Повторите новый пароль"),
        "forgot_password_send_email":
            MessageLookupByLibrary.simpleMessage("Отправить"),
        "forgot_password_token": MessageLookupByLibrary.simpleMessage("Токен"),
        "forgot_password_your_email":
            MessageLookupByLibrary.simpleMessage("Ваша почта"),
        "history_bid": MessageLookupByLibrary.simpleMessage("История"),
        "history_orders_basis":
            MessageLookupByLibrary.simpleMessage("Условия поставки"),
        "history_orders_companyName":
            MessageLookupByLibrary.simpleMessage("Компания"),
        "history_orders_contract":
            MessageLookupByLibrary.simpleMessage("Контракт"),
        "history_orders_leftToDeliverVolume":
            MessageLookupByLibrary.simpleMessage("Не доставлено, тонн"),
        "history_orders_payedVolume":
            MessageLookupByLibrary.simpleMessage("Оплачено, тонн"),
        "history_orders_price":
            MessageLookupByLibrary.simpleMessage("Цена, руб/тонна"),
        "history_orders_productName":
            MessageLookupByLibrary.simpleMessage("Продукт"),
        "history_orders_realVolume":
            MessageLookupByLibrary.simpleMessage("Отгружено, тонн"),
        "history_orders_specName":
            MessageLookupByLibrary.simpleMessage("Спецификация"),
        "history_orders_startDate":
            MessageLookupByLibrary.simpleMessage("Дата"),
        "history_orders_status": MessageLookupByLibrary.simpleMessage("Статус"),
        "history_orders_totalVolume":
            MessageLookupByLibrary.simpleMessage("Общий объём, тонн"),
        "history_orders_unpaidVolume":
            MessageLookupByLibrary.simpleMessage("Не оплачено, тонн"),
        "i_agree_phone_auth":
            MessageLookupByLibrary.simpleMessage("Я соглашаюсь с "),
        "kach_status1": MessageLookupByLibrary.simpleMessage(
            "Назначен специалист на проверку качества"),
        "kach_status1_with_address": MessageLookupByLibrary.simpleMessage(
            "Назначен специалист на проверку качества по адресу:"),
        "kach_status2": MessageLookupByLibrary.simpleMessage(
            "Специалист выехал по адресу места хранения"),
        "kach_status3":
            MessageLookupByLibrary.simpleMessage("Специалист отобрал пробы"),
        "kach_status4": MessageLookupByLibrary.simpleMessage(
            "Пробы доставлены в лабораторию"),
        "kach_status5": MessageLookupByLibrary.simpleMessage(
            "Качество соответствует спецификации"),
        "kach_status6": MessageLookupByLibrary.simpleMessage(
            "Качество не соответствует спецификации"),
        "left": MessageLookupByLibrary.simpleMessage("осталось"),
        "licanze_order_phone_auth":
            MessageLookupByLibrary.simpleMessage("Лицензионным договором,"),
        "link_to_sdk_button":
            MessageLookupByLibrary.simpleMessage("Подключить"),
        "link_to_sdk_description": MessageLookupByLibrary.simpleMessage(
            "Очень хорошо бы еще дополнительно объяснить что нужно и зачем. Для начала работы и автоматизации работы с документами, вам необходимо подключить myDSS"),
        "link_to_sdk_device":
            MessageLookupByLibrary.simpleMessage("Название устройства"),
        "link_to_sdk_title":
            MessageLookupByLibrary.simpleMessage("Подключить myDSS"),
        "link_to_sdk_username":
            MessageLookupByLibrary.simpleMessage("Ваше имя"),
        "link_to_sdk_whats_going_on":
            MessageLookupByLibrary.simpleMessage("Что тут происходит?"),
        "loading": MessageLookupByLibrary.simpleMessage("Загружаем..."),
        "modal_close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "modal_something_went_wrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так..."),
        "modal_try_again": MessageLookupByLibrary.simpleMessage(
            "При подписании документов произошла ошибка, попробуйте снова"),
        "mydss_installed_alias":
            MessageLookupByLibrary.simpleMessage("Сообщите менеджерам код:"),
        "mydss_installed_btn_confirm":
            MessageLookupByLibrary.simpleMessage("Проверить данные профиля"),
        "mydss_installed_btn_refresh":
            MessageLookupByLibrary.simpleMessage("Обновить"),
        "mydss_installed_btn_req_confirm":
            MessageLookupByLibrary.simpleMessage("Подписать"),
        "mydss_installed_confirm":
            MessageLookupByLibrary.simpleMessage("Подтвердите данные профиля"),
        "mydss_installed_req_confirm": MessageLookupByLibrary.simpleMessage(
            "Подпишите запрос на сертификат"),
        "mydss_installed_req_wait": MessageLookupByLibrary.simpleMessage(
            "Менеджер оформляет заявку на сертификат, ожидайте информацию о следующих дейяствиях"),
        "mydss_installed_title":
            MessageLookupByLibrary.simpleMessage("Статус подключения SDK"),
        "name_inn_phone_auth": MessageLookupByLibrary.simpleMessage(
            "Название или ИНН вашего предприятия"),
        "need_certificate": MessageLookupByLibrary.simpleMessage(
            "Необходимо выпустить сертификат"),
        "new_message_bid":
            MessageLookupByLibrary.simpleMessage("новое сообщение"),
        "new_messages_bid":
            MessageLookupByLibrary.simpleMessage("новых сообщений"),
        "new_offer_bid":
            MessageLookupByLibrary.simpleMessage("Новое предложение"),
        "no_delete_acc": MessageLookupByLibrary.simpleMessage("Нет"),
        "not_new_message_bid":
            MessageLookupByLibrary.simpleMessage("Новых сообщений нет"),
        "offer_accept": MessageLookupByLibrary.simpleMessage("Принять сделку"),
        "offer_age": MessageLookupByLibrary.simpleMessage("Срок вывоза"),
        "offer_enter_weight": MessageLookupByLibrary.simpleMessage(
            "Введите объем сделки - целое значение (т)"),
        "offer_final_price":
            MessageLookupByLibrary.simpleMessage("Финальная стоимость без НДС"),
        "offer_final_price_nds":
            MessageLookupByLibrary.simpleMessage("Финальная стоимость с НДС"),
        "offer_kley": MessageLookupByLibrary.simpleMessage("Cырая клейковина"),
        "offer_nature": MessageLookupByLibrary.simpleMessage("Натура"),
        "offer_offert": MessageLookupByLibrary.simpleMessage(
            "Нажимая кнопку Принять сделку, вы соглашаетесь с "),
        "offer_offert_accept":
            MessageLookupByLibrary.simpleMessage("условия оферты"),
        "offer_offert_accept_consentPersonalData":
            MessageLookupByLibrary.simpleMessage(
                "Политикой обработки персональных данных"),
        "offer_offert_accept_license": MessageLookupByLibrary.simpleMessage(
            "Условиями лицензионного договора"),
        "offer_offert_my_message":
            MessageLookupByLibrary.simpleMessage("Сообщение покупателю"),
        "offer_offert_price_per_ton":
            MessageLookupByLibrary.simpleMessage("Цена за тонну"),
        "offer_offert_send_my_offer":
            MessageLookupByLibrary.simpleMessage("Отправить предложение"),
        "offer_price_nds": MessageLookupByLibrary.simpleMessage("Цена с НДС"),
        "offer_price_wnds":
            MessageLookupByLibrary.simpleMessage("Цена без НДС"),
        "offer_primes": MessageLookupByLibrary.simpleMessage("Сорная примесь"),
        "offer_select_address":
            MessageLookupByLibrary.simpleMessage("Выберите склад отгрузки"),
        "offer_stekl": MessageLookupByLibrary.simpleMessage("Стекловидность"),
        "offer_vlaga": MessageLookupByLibrary.simpleMessage("Влага"),
        "offer_weight": MessageLookupByLibrary.simpleMessage("Объем"),
        "offers": MessageLookupByLibrary.simpleMessage("Рынок"),
        "offers_subtitle": MessageLookupByLibrary.simpleMessage(
            "Цена «на колесах» без НДС (с погрузкой в машину)"),
        "offers_title": MessageLookupByLibrary.simpleMessage("Рынок"),
        "ok_accredit_title_status_profile":
            MessageLookupByLibrary.simpleMessage("Компания аккредитована"),
        "ok_user_title_status_profile":
            MessageLookupByLibrary.simpleMessage("Пользователь проверен"),
        "open_offer_bid":
            MessageLookupByLibrary.simpleMessage("Открыть сделку"),
        "orders_showcase_filter_discription": MessageLookupByLibrary.simpleMessage(
            "Здесь Вы можете отфильтровать сделки по типу: активные, завершенные или аннулированые"),
        "orders_showcase_filter_swipe": MessageLookupByLibrary.simpleMessage(
            "Вы так же можете перемещаться между экранами с разными типами сделок с помощью свайпа влево/вправо"),
        "orders_showcase_filter_title":
            MessageLookupByLibrary.simpleMessage("Фильтр"),
        "orders_type_active": MessageLookupByLibrary.simpleMessage("Активные"),
        "orders_type_active_not":
            MessageLookupByLibrary.simpleMessage("Активных сделок нет"),
        "orders_type_cancelled":
            MessageLookupByLibrary.simpleMessage("Аннулированные"),
        "orders_type_cancelled_not":
            MessageLookupByLibrary.simpleMessage("Аннулированных сделок нет"),
        "orders_type_completed":
            MessageLookupByLibrary.simpleMessage("Завершенные"),
        "orders_type_completed_not":
            MessageLookupByLibrary.simpleMessage("Завершенных сделок нет"),
        "orders_type_history":
            MessageLookupByLibrary.simpleMessage("Исторические"),
        "orders_type_history_not":
            MessageLookupByLibrary.simpleMessage("Исторических сделок нет"),
        "person_data": MessageLookupByLibrary.simpleMessage(
            "Обработка персональных данных"),
        "policy_confidation_phone_auth": MessageLookupByLibrary.simpleMessage(
            "Политикой конфеденциальности, "),
        "price": m6,
        "price_nds": m7,
        "price_screen_subtitle": MessageLookupByLibrary.simpleMessage(
            "Все цены указаны без НДС, на воротах порта"),
        "price_screen_write_me":
            MessageLookupByLibrary.simpleMessage("напишите нам"),
        "price_screen_write_me_description":
            MessageLookupByLibrary.simpleMessage(
                "Если вы не нашли культуру, которую хотели бы продать — "),
        "price_screen_write_whatsapp":
            MessageLookupByLibrary.simpleMessage("Написать в Whatsapp"),
        "price_weight": m8,
        "price_wnds": m9,
        "price_wthout_nds_bid":
            MessageLookupByLibrary.simpleMessage("Цена без НДС"),
        "prices": MessageLookupByLibrary.simpleMessage("Цены"),
        "privacy_policy_phone_auth": MessageLookupByLibrary.simpleMessage(
            "Обработкой персональных данных"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "profile_about": MessageLookupByLibrary.simpleMessage("О приложении"),
        "profile_about_subtitle": MessageLookupByLibrary.simpleMessage(
            "Закупка зерновых по всей России. Покупка и продажа аграрной продукции"),
        "profile_about_text1": MessageLookupByLibrary.simpleMessage(
            "Silk - частная международная группа, занимающаяся торговлей сельскохозяйственными товарами. Материнская компания группы - DAYLES HOLDING LIMITED, оперирует на территории Европы под единым брэндом Daylesford Merchant. В России интересы группы представляет компания ООО \"Дейлсфорд Мёрчант\""),
        "profile_about_text2": MessageLookupByLibrary.simpleMessage(
            "Основными нашими контрагентами являются крупнейшие товарные трейдеры, давно оперирующие на рынке. Сотрудничество с ними дает уверенность в соблюдении всех коммерческих и финансовых договоренностей в заключаемых контрактах."),
        "profile_about_title": MessageLookupByLibrary.simpleMessage("Silk"),
        "profile_about_title1": MessageLookupByLibrary.simpleMessage("О нас"),
        "profile_about_title2":
            MessageLookupByLibrary.simpleMessage("Основные контрагенты"),
        "profile_address_add":
            MessageLookupByLibrary.simpleMessage("Добавить адрес"),
        "profile_address_delete":
            MessageLookupByLibrary.simpleMessage("Удалить"),
        "profile_address_dialog_confirm":
            MessageLookupByLibrary.simpleMessage("Да, удалить"),
        "profile_address_dialog_title":
            MessageLookupByLibrary.simpleMessage("Удалить этот адрес?"),
        "profile_address_enter":
            MessageLookupByLibrary.simpleMessage("Введите адрес..."),
        "profile_address_save":
            MessageLookupByLibrary.simpleMessage("Сохранить"),
        "profile_address_title":
            MessageLookupByLibrary.simpleMessage("Мои адреса"),
        "profile_adresses": MessageLookupByLibrary.simpleMessage("Мои адреса"),
        "profile_backfeed":
            MessageLookupByLibrary.simpleMessage("Связаться с нами"),
        "profile_contact_us_address":
            MessageLookupByLibrary.simpleMessage("Мы находимся по адресу"),
        "profile_contact_us_address1": MessageLookupByLibrary.simpleMessage(
            "117447, г. Москва, ул. Большая Черемушкинская д. 13 стр. 4, пом. 2, ком. 23"),
        "profile_contact_us_email":
            MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "profile_contact_us_email1":
            MessageLookupByLibrary.simpleMessage("info@silktech.one"),
        "profile_copyright":
            MessageLookupByLibrary.simpleMessage("Сделано с 🖤 командой Silk"),
        "profile_edo_connect":
            MessageLookupByLibrary.simpleMessage("Подключить ЭДО"),
        "profile_edo_subtitle": MessageLookupByLibrary.simpleMessage(
            "Для подписания документов необходимо выпустить УКЭП"),
        "profile_edo_title": MessageLookupByLibrary.simpleMessage(
            "Электронный документооборот (ЭДО)"),
        "profile_exit": MessageLookupByLibrary.simpleMessage("Выйти"),
        "profile_license_kontrakt":
            MessageLookupByLibrary.simpleMessage("Лицензионный договор"),
        "profile_my_company":
            MessageLookupByLibrary.simpleMessage("Данные о компании"),
        "profile_policy":
            MessageLookupByLibrary.simpleMessage("Политика конфиденциальности"),
        "profile_version": m10,
        "range_max": MessageLookupByLibrary.simpleMessage("Не более"),
        "range_min": MessageLookupByLibrary.simpleMessage("Не менее"),
        "registration_phone_auth":
            MessageLookupByLibrary.simpleMessage("Регистрация"),
        "repeat": MessageLookupByLibrary.simpleMessage("Повторить"),
        "repots": MessageLookupByLibrary.simpleMessage("Отчёты"),
        "rub_with_nds_bid": MessageLookupByLibrary.simpleMessage("руб с НДС"),
        "send_new_code2_phone_auth":
            MessageLookupByLibrary.simpleMessage("Выслать новый код"),
        "send_new_code_phone_auth":
            MessageLookupByLibrary.simpleMessage("Выслать новый код через:"),
        "shipment_accept":
            MessageLookupByLibrary.simpleMessage("Подтверждаю погрузку"),
        "shipment_await": MessageLookupByLibrary.simpleMessage(
            "Скоро здесь будут номера машин "),
        "shipment_close_docs": MessageLookupByLibrary.simpleMessage(
            "Закрывающие документы по текущему реестру будут сформированы автоматически."),
        "shipment_decline":
            MessageLookupByLibrary.simpleMessage("Нет, обсудить проблему"),
        "shipment_fact": MessageLookupByLibrary.simpleMessage("Факт погрузки"),
        "shipment_offert": MessageLookupByLibrary.simpleMessage(
            "Нажимая «Подтверждаю погрузку», вы принимаете"),
        "shipment_offert_accept":
            MessageLookupByLibrary.simpleMessage("условия оферты"),
        "shipment_otrg_day":
            MessageLookupByLibrary.simpleMessage("Погружено за день:"),
        "shipment_plan":
            MessageLookupByLibrary.simpleMessage("План погрузки списком"),
        "shipment_plane":
            MessageLookupByLibrary.simpleMessage("Планируется к погрузке"),
        "shipment_registry":
            MessageLookupByLibrary.simpleMessage("Реестр машин списком"),
        "shipment_send":
            MessageLookupByLibrary.simpleMessage("Отправить через..."),
        "shipment_subtitle1":
            MessageLookupByLibrary.simpleMessage("Погрузка начнется завтра"),
        "shipment_subtitle2":
            MessageLookupByLibrary.simpleMessage("Погрузка начнется завтра"),
        "shipment_subtitle3":
            MessageLookupByLibrary.simpleMessage("Погрузка начнется завтра"),
        "shipment_subtitle4":
            MessageLookupByLibrary.simpleMessage("Необходимо подтверждение"),
        "shipment_subtitle5":
            MessageLookupByLibrary.simpleMessage("Погрузка продолжится завтра"),
        "shipment_title1":
            MessageLookupByLibrary.simpleMessage("Формируем реестр машин"),
        "shipment_title2":
            MessageLookupByLibrary.simpleMessage("Реестр машин сформирован"),
        "shipment_title3":
            MessageLookupByLibrary.simpleMessage("Идет погрузка"),
        "shipment_title4": m11,
        "shipment_title5": m12,
        "signin_reg_pthone_auth":
            MessageLookupByLibrary.simpleMessage("Войти или создать аккаунт"),
        "status_1": MessageLookupByLibrary.simpleMessage("Сделка заключена"),
        "status_2": MessageLookupByLibrary.simpleMessage("Проверка качества"),
        "status_3": MessageLookupByLibrary.simpleMessage("Оплата"),
        "status_4": MessageLookupByLibrary.simpleMessage("Погрузка"),
        "status_5": MessageLookupByLibrary.simpleMessage("Погрузка завершена"),
        "status_6": MessageLookupByLibrary.simpleMessage("Сделка закрыта"),
        "sverka_status1":
            MessageLookupByLibrary.simpleMessage("Оплата произведена"),
        "sverka_status2":
            MessageLookupByLibrary.simpleMessage("Документы сформированы"),
        "take_bid": MessageLookupByLibrary.simpleMessage("Принять"),
        "take_code_phone_auth":
            MessageLookupByLibrary.simpleMessage("Получить код"),
        "take_offer_bid":
            MessageLookupByLibrary.simpleMessage("Принять сделку"),
        "take_price_buyer_bid":
            MessageLookupByLibrary.simpleMessage("Принять цену покупателя"),
        "tonn_bid": MessageLookupByLibrary.simpleMessage("тонн"),
        "update_price_bid":
            MessageLookupByLibrary.simpleMessage("Обновить цену"),
        "view_document":
            MessageLookupByLibrary.simpleMessage("Просмотр документа"),
        "volume_bid": MessageLookupByLibrary.simpleMessage("Объём"),
        "warehouse_address": MessageLookupByLibrary.simpleMessage("Адрес"),
        "warehouse_name": MessageLookupByLibrary.simpleMessage("Наименование"),
        "warehouse_normal_volume":
            MessageLookupByLibrary.simpleMessage("Норма выгрузки"),
        "warehouse_search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "weight": m13,
        "wellcome_phone_auth":
            MessageLookupByLibrary.simpleMessage("Добро пожаловать!"),
        "yes_delete_acc": MessageLookupByLibrary.simpleMessage("Да"),
        "you_do_status_profile_bottomsheet":
            MessageLookupByLibrary.simpleMessage("Ваша электронная почта"),
        "you_must_take_offer_bid": MessageLookupByLibrary.simpleMessage(
            "Ваша очередь теперь принять сделку"),
        "you_ready_take_offer_bid": MessageLookupByLibrary.simpleMessage(
            "Вы готовы принять предложение покупателя"),
        "your_message_bid":
            MessageLookupByLibrary.simpleMessage("Ваше сообщение"),
        "your_name_status_profile_bottomsheet":
            MessageLookupByLibrary.simpleMessage("Ваше имя"),
        "your_offer_bid":
            MessageLookupByLibrary.simpleMessage("Ваше предложение"),
        "your_phone_phone_auth":
            MessageLookupByLibrary.simpleMessage("Ваш номер телефона")
      };
}
