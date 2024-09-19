import 'package:flutter/material.dart';
import 'package:payment_templet/core/utils/styles.dart';

class OrdreItemInfo extends StatelessWidget {
  const OrdreItemInfo({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        Spacer(),
        Text(
          value,
          style: Styles.style18,
        )
      ],
    );
  }
}
