import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_templet/core/widget/custom_bottom.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool isCvvFocused = false;
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (onCreditCardModel) {},
        ),
        CreditCardForm(
            autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (onCreditCardModel) {
              expiryDate = onCreditCardModel.expiryDate;
              cardHolderName = onCreditCardModel.cardHolderName;
              cardNumber = onCreditCardModel.cardNumber;
              cvvCode = onCreditCardModel.cvvCode;
              showBackView = onCreditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey),
      ],
    );
  }
}
