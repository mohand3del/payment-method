import 'package:either_dart/either.dart';
import 'package:payment_templet/features/Cart/data/model/payment_intent_model/payment_intent_input_model.dart';

import '../../../../core/services/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
