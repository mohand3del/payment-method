import 'package:either_dart/either.dart';
import 'package:payment_templet/core/services/failure.dart';
import 'package:payment_templet/core/services/stripe_service.dart';
import 'package:payment_templet/features/Cart/data/model/payment_intent_model/payment_intent_input_model.dart';

import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }
}
