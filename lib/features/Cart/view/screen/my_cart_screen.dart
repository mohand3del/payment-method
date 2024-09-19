import 'package:flutter/material.dart';
import 'package:payment_templet/core/widget/custom_app_bar.dart';
import 'package:payment_templet/features/Cart/view/widget/cusatom_app_bar.dart';
import 'package:payment_templet/features/Cart/view/widget/my_cart_body.dart';

class MyCartScreen extends StatelessWidget {
  MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: "My Cart"),
        body: MyCartBody(),
      ),
    );
  }
}
