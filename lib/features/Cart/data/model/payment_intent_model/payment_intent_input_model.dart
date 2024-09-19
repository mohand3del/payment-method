class PaymentIntentInputModel {
  String? amount;
  String? currency;

  PaymentIntentInputModel({this.amount, this.currency});

  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
