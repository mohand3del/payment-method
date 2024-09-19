import 'package:flutter/material.dart';
import 'package:payment_templet/core/widget/custom_app_bar.dart';
import 'package:payment_templet/features/Cart/view/widget/payment_details_body.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: "Payment Details"),
        body: PaymentDetailsBody(),
      ),
    );
  }
}
