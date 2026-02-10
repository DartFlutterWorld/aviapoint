import 'package:aviapoint/payment/data/models/subscription_type_model.dart';
import 'package:aviapoint/payment/utils/payment_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Состояния процесса покупки подписки через IAP (профиль).
sealed class SubscriptionPurchaseState {
  const SubscriptionPurchaseState();
}

class SubscriptionPurchaseInitial extends SubscriptionPurchaseState {
  const SubscriptionPurchaseInitial();
}

class SubscriptionPurchaseLoading extends SubscriptionPurchaseState {
  const SubscriptionPurchaseLoading();
}

class SubscriptionPurchaseSuccess extends SubscriptionPurchaseState {
  const SubscriptionPurchaseSuccess();
}

class SubscriptionPurchaseError extends SubscriptionPurchaseState {
  final String errorForUser;
  const SubscriptionPurchaseError(this.errorForUser);
}

/// Cubit для покупки подписки через IAP. Используется в профиле с BlocListener и ErrorCustom.
class SubscriptionPurchaseCubit extends Cubit<SubscriptionPurchaseState> {
  SubscriptionPurchaseCubit() : super(const SubscriptionPurchaseInitial());

  SubscriptionTypeModel? _lastType;
  String? _lastReturnRouteSource;

  /// Запуск покупки. Повторный вызов (Повторить) использует те же параметры.
  Future<void> startPurchase(
    BuildContext context, {
    required SubscriptionTypeModel subscriptionType,
    String? returnRouteSource = 'profile',
  }) async {
    _lastType = subscriptionType;
    _lastReturnRouteSource = returnRouteSource;
    emit(const SubscriptionPurchaseLoading());
    final result = await PaymentHelper.runIAPPurchaseWithoutUI(
      context: context,
      subscriptionTypeId: subscriptionType.id,
      returnRouteSource: returnRouteSource,
    );
    if (!context.mounted) return;
    if (result.success) {
      emit(const SubscriptionPurchaseSuccess());
    } else {
      emit(SubscriptionPurchaseError(result.errorForUser ?? 'Что-то пошло не так!\nПопробуйте повторить запрос'));
    }
  }

  /// Повторить последнюю попытку покупки (для ErrorCustom.repeat).
  void retry(BuildContext context) {
    final type = _lastType;
    if (type != null) startPurchase(context, subscriptionType: type, returnRouteSource: _lastReturnRouteSource);
  }
}
