import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_templet/core/services/api_service.dart';
import 'package:payment_templet/core/utils/api_keys.dart';
import 'package:payment_templet/features/Cart/data/model/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_templet/features/Cart/data/model/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.seckretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
   await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'Mohand',
    ));
  }

  Future displayPaymentSheet() async {
   
      await Stripe.instance.presentPaymentSheet();
   
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret!);

    await displayPaymentSheet();
  }
}
