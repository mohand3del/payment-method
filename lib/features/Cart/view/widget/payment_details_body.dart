import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_templet/core/widget/custom_bottom.dart';
import 'package:payment_templet/features/Cart/view/widget/custom_credit_card.dart';
import 'package:payment_templet/features/Cart/view/widget/payment_method_list_view.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autovalidateMode: AutovalidateMode.always,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: CustomBottom(
                text: 'Pay',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('payment');
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
