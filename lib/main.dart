import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_templet/core/utils/api_keys.dart';
import 'package:payment_templet/features/Cart/data/repo/checkout_repo_impl.dart';
import 'package:payment_templet/features/Cart/view/screen/my_cart_screen.dart';
import 'package:payment_templet/features/Cart/view/screen/payment_details_screen.dart';
import 'package:payment_templet/features/Cart/view/screen/thank_you_screen.dart';
import 'package:payment_templet/features/Cart/view_model/cubit/stripe_payment_cubit.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => StripePaymentCubit(CheckoutRepoImpl()),
          child: MyCartScreen(),
        ),
      ),
    );
  }
}
