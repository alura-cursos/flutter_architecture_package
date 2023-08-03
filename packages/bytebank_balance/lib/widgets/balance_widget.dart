part of '../bytebank_balance.dart';

class BytebankBalance extends StatelessWidget {
  final Color color;
  const BytebankBalance({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Saldo",
          style: TextStyle(
            fontSize: 20,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: color, thickness: 2),
        ),
        Text(
          "Conta Corrente",
          style: TextStyle(
            color: color,
            fontSize: 16,
          ),
        ),
        Text(
          "R\$ 2.500,00",
          style: TextStyle(
            color: color,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
