import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:aviapoint/payment/utils/payment_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscribeWidget extends StatelessWidget {
  final SubscriptionTypeModel subscriptionType;
  final String fon;
  /// Если передан, по нажатию «Оформить подписку» вызывается он (Cubit в профиле). Иначе — PaymentHelper.
  final VoidCallback? onPurchase;

  const SubscribeWidget({
    super.key,
    required this.subscriptionType,
    required this.fon,
    this.onPurchase,
  });

  Future<void> _navigateToPayment(BuildContext context) async {
    if (!context.mounted) return;
    if (onPurchase != null) {
      onPurchase!();
      return;
    }
    await PaymentHelper.createPaymentAndRedirect(
      context: context,
      amount: subscriptionType.price.toDouble(),
      currency: 'RUB',
      description: subscriptionType.name,
      subscriptionTypeId: subscriptionType.id,
      returnRouteSource: 'profile',
    );
  }

  String _formatPrice(int price) {
    // Форматируем цену с пробелами для тысяч
    final formatted = price.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ');
    return '$formatted ₽';
  }

  String _formatPeriod(int periodDays) {
    if (periodDays >= 365) {
      final years = periodDays ~/ 365;
      return years == 1 ? '12 месяцев' : '$years года';
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
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),

        height: Provider.of<AppState>(context).isTablet || kIsWeb ? 450 : 225,
        width: Provider.of<AppState>(context).isTablet || kIsWeb ? 350 : 176,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(fon), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(9),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Название подписки (требование App Store 3.1.2)
            Text(
              subscriptionType.name,
              style: AppStyles.extraBold.copyWith(color: Color(0xFF223B76), fontStyle: FontStyle.italic, fontSize: 16.0),
            ),
            SizedBox(height: 6),
            Text(subscriptionType.description, style: AppStyles.light12s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 6),
            // Срок подписки (требование App Store 3.1.2)
            Text('Срок: ${_formatPeriod(subscriptionType.periodDays)}', style: AppStyles.regular12s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 2),
            // Цена и цена за единицу срока (требование App Store 3.1.2)
            RichText(
              text: TextSpan(
                style: AppStyles.light12s.copyWith(color: Color(0xFF374151)),
                children: [
                  TextSpan(
                    text: 'Цена: ',
                    style: AppStyles.light12s.copyWith(color: Color(0xFF374151)),
                  ),
                  TextSpan(
                    text: '${_formatPrice(subscriptionType.price)}',
                    style: AppStyles.light12s.copyWith(color: Color(0xFF0A6EFA)),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Оформить подписку',
              verticalPadding: 8,
              backgroundColor: Color(0xFF0A6EFA),
              onPressed: () => _navigateToPayment(context),
              borderRadius: 46,
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
