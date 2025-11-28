class PaymentEntity {
  final String id;
  final String status;
  final double amount;
  final String currency;
  final String? description;
  final String? paymentUrl;
  final String? confirmationToken;
  final DateTime? createdAt;
  final bool? paid;

  PaymentEntity({required this.id, required this.status, required this.amount, required this.currency, this.description, this.paymentUrl, this.confirmationToken, this.createdAt, this.paid});

  bool get isSucceeded => status == 'succeeded';
  bool get isPending => status == 'pending' || status == 'waiting_for_capture';
  bool get isCanceled => status == 'canceled';
}
