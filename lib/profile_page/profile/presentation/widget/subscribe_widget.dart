import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:aviapoint/payment/presentation/pages/payment_screen.dart';
import 'package:aviapoint/payment/utils/payment_url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribeWidget extends StatelessWidget {
  final SubscriptionTypeModel subscriptionType;
  final String fon;
  const SubscribeWidget({super.key, required this.subscriptionType, required this.fon});

  Future<void> _navigateToPayment(BuildContext context) async {
    // Добавляем небольшую задержку для стабилизации UI
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // Используем Navigator напрямую для модального экрана
    if (!context.mounted) {
      final rootContext = navigatorKey.currentContext;
      if (rootContext != null && rootContext.mounted) {
        await _openPaymentScreen(rootContext);
      }
      return;
    }

    await _openPaymentScreen(context);
  }

  Future<void> _openPaymentScreen(BuildContext context) async {
    try {
      // Используем SchedulerBinding для отложенной навигации
      await SchedulerBinding.instance.endOfFrame;

      if (!context.mounted) return;

      if (!context.mounted) return;

      await Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute<dynamic>(
          builder: (_) => PaymentScreen(
            amount: subscriptionType.price.toDouble(),
            currency: 'RUB',
            description: 'Оплата подписки - ${subscriptionType.name} - РосАвиаТест - тренировочный режим',
            subscriptionTypeId: subscriptionType.id,
            returnUrl: PaymentUrlHelper.buildReturnUrl(source: 'profile'),
            returnRouteSource: 'profile',
          ),
        ),
      );
    } catch (e, stackTrace) {
      print('❌ Ошибка при открытии PaymentScreen: $e');
      print('StackTrace: $stackTrace');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка при загрузке типов подписок: $e'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
      }
    }
  }

  String _formatPrice(int price) {
    // Форматируем цену с пробелами для тысяч
    final formatted = price.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ');
    return '$formatted ₽';
  }

  String _formatPeriod(int periodDays) {
    if (periodDays >= 365) {
      final years = periodDays ~/ 365;
      return years == 1 ? 'год' : '$years года';
    } else if (periodDays >= 30) {
      final months = periodDays ~/ 30;
      return months == 1 ? 'месяц' : '$months месяца';
    } else {
      return periodDays == 1 ? 'день' : '$periodDays дней';
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final isActive = subscription!.isActive && subscription.endDate.isAfter(DateTime.now());
    // final isExpired = subscription!.endDate.isBefore(DateTime.now());
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        height: 225.h,
        width: 176.w,

        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(fon)),
          borderRadius: BorderRadius.circular(9),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              subscriptionType.name,
              style: AppStyles.extraBold.copyWith(color: Color(0xFF223B76), fontStyle: FontStyle.italic, fontSize: 16.sp),
            ),
            SizedBox(height: 8),
            Text(subscriptionType.description, style: AppStyles.light12s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: AppStyles.light12s.copyWith(color: Color(0xFF374151)),
                children: [
                  TextSpan(
                    text: 'Стоимость: ',
                    style: AppStyles.light12s.copyWith(color: Color(0xFF374151)),
                  ),
                  TextSpan(
                    text: '${_formatPrice(subscriptionType.price)}/${_formatPeriod(subscriptionType.periodDays)}',
                    style: AppStyles.light12s.copyWith(color: Color(0xFF0A6EFA)),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Оформить подписку',
              verticalPadding: 8.h,
              backgroundColor: Color(0xFF0A6EFA),
              onPressed: () => _navigateToPayment(context),
              borderRadius: 46.r,
              textStyle: AppStyles.bold12s.copyWith(color: Colors.white),
              borderColor: Color(0xFF0A6EFA),
              boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.28), blurRadius: 17.8, spreadRadius: 0, offset: Offset(0.0, 7.0))],
            ),
          ],
        ),
      ),
    );
  }
}
