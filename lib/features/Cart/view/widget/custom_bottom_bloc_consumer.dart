import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_templet/core/widget/custom_bottom.dart';
import 'package:payment_templet/features/Cart/data/model/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_templet/features/Cart/view/widget/thank_you_card.dart';

import '../../data/repo/checkout_repo_impl.dart';
import '../../view_model/cubit/stripe_payment_cubit.dart';
import 'payment_bottom_sheet.dart';

class CustomBottomBlocConsumer extends StatelessWidget {
  const CustomBottomBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ThankYouCard()));
        }
        if (state is StripePaymentError) {
          SnackBar snackBar = SnackBar(
            content: Text(state.message),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomBottom(
            isLogin: state is StripePaymentLoading ? true : false,
            text: 'Checkout',
            onPressed: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: '100',
                currency: 'USD',
              );

              context.read<StripePaymentCubit>().makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);

           
            });
      },
    );
  }
}
