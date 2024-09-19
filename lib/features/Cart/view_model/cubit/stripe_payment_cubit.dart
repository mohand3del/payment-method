import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_templet/features/Cart/data/model/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_templet/features/Cart/data/repo/checkout_repo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    
    var data =  await checkoutRepo.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

    data.fold((l) {
      emit(StripePaymentError( message: l.message,));
    }, (r) {
      emit(StripePaymentSuccess());
    });
    
    }
   
   @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
  
}
