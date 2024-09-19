import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_templet/core/widget/custom_bottom.dart';
import 'package:payment_templet/features/Cart/data/repo/checkout_repo.dart';
import 'package:payment_templet/features/Cart/data/repo/checkout_repo_impl.dart';
import 'package:payment_templet/features/Cart/view/widget/custom_bottom_bloc_consumer.dart';
import 'package:payment_templet/features/Cart/view/widget/order_item_info.dart';
import 'package:payment_templet/features/Cart/view/widget/payment_bottom_sheet.dart';
import 'package:payment_templet/features/Cart/view/widget/total_price.dart';
import 'package:payment_templet/features/Cart/view_model/cubit/stripe_payment_cubit.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Image.asset("assets/image/basket.png"),
              const SizedBox(
                height: 25,
              ),
              const OrdreItemInfo(
                title: 'Order Subtotal',
                value: '\$40.00',
              ),
              const SizedBox(
                height: 3,
              ),
              const OrdreItemInfo(
                title: 'Discount',
                value: '\$10.00',
              ),
              const SizedBox(
                height: 3,
              ),
              const OrdreItemInfo(
                title: 'Shipping',
                value: '\$8.00',
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffC7C7C7),
                height: 34,
              ),
              TotalPrice(title: 'Total', value: '\$48.00'),
              SizedBox(
                height: 20,
              ),
              CustomBottomBlocConsumer()
            ],
          ),
        ),
      ),
    );
  }
}


