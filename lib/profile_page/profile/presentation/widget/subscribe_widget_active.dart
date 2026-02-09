import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscribeWidgetActive extends StatelessWidget {
  final SubscriptionDto subscription;
  final String fon;

  const SubscribeWidgetActive({super.key, required this.subscription, required this.fon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        height: Provider.of<AppState>(context).isTablet || kIsWeb ? 280 : 225,
        width: Provider.of<AppState>(context).isTablet || kIsWeb ? 210 : 176,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(fon), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Подписка на обучение\nактивна',
              style: AppStyles.extraBold.copyWith(color: Color(0xFF223B76), fontStyle: FontStyle.italic, fontSize: 16.0),
            ),
            SizedBox(height: 8),
            Text('Вам доступен - Тренировочный режим', style: AppStyles.light12s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 8),
            ...[
              Text('${formatDate(subscription.startDate)} - ${formatDate(subscription.endDate)}', style: AppStyles.light12s.copyWith(color: Color(0xFF374151))),
              SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: AppStyles.light12s.copyWith(color: Color(0xFF374151)),
                  children: [
                    TextSpan(
                      text: 'Стоимость: ',
                      style: AppStyles.light12s.copyWith(color: Color(0xFF374151)),
                    ),
                    TextSpan(
                      text: '${subscription.amount} ₽',
                      style: AppStyles.light12s.copyWith(color: Color(0xFF0A6EFA)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                subscription.periodDays.toString(),
                style: AppStyles.light12s.copyWith(color: Color(0xFF0A6EFA), fontSize: 50, fontWeight: FontWeight.w800),
              ),

              Text(
                'дней',
                style: AppStyles.light12s.copyWith(color: Color(0xFF2B373E), fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
