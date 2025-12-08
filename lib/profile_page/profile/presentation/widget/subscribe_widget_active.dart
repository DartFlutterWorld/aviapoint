import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/payment/data/models/subscription_dto.dart';
import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SubscribeWidgetActive extends StatelessWidget {
  final SubscriptionDto subscription;
  final String fon;

  const SubscribeWidgetActive({super.key, required this.subscription, required this.fon});

  String _formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy', 'ru_RU').format(date);
  }

  @override
  Widget build(BuildContext context) {
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
              'Подписка на обучение\nактивна',
              style: AppStyles.extraBold.copyWith(color: Color(0xFF223B76), fontStyle: FontStyle.italic, fontSize: 16.sp),
            ),
            SizedBox(height: 8),
            Text('Вам доступен - Тренировочный режим', style: AppStyles.light12s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 8),
            ...[
              Text('${_formatDate(subscription.startDate)} - ${_formatDate(subscription.endDate)}', style: AppStyles.light12s.copyWith(color: Color(0xFF374151))),
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
