import 'package:flutter/material.dart';

import '../../_core/constants/bytebank_colors.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Saldo",
          style: TextStyle(
            fontSize: 20,
            color: BytebankColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: BytebankColors.white, thickness: 2),
        ),
        Text(
          "Conta Corrente",
          style: TextStyle(
            color: BytebankColors.white,
            fontSize: 16,
          ),
        ),
        Text(
          "R\$ 2.500,00",
          style: TextStyle(
            color: BytebankColors.white,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
