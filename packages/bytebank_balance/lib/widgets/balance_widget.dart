part of '../bytebank_balance.dart';

class BytebankBalance extends StatefulWidget {
  final Color color;
  final String userId;
  const BytebankBalance({super.key, required this.color, required this.userId});

  @override
  State<BytebankBalance> createState() => _BytebankBalanceState();
}

class _BytebankBalanceState extends State<BytebankBalance> {
  bool isShowingBalance = false;
  double userBalance = 0;
  BalanceService balanceService = BalanceService();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Saldo",
              style: TextStyle(
                fontSize: 20,
                color: widget.color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 24),
            IconButton(
              onPressed: () {
                onVisibilityBalanceClicked();
              },
              icon: Icon(
                (isShowingBalance) ? Icons.visibility : Icons.visibility_off,
                color: widget.color,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: widget.color, thickness: 2),
        ),
        Text(
          "Conta Corrente",
          style: TextStyle(
            color: widget.color,
            fontSize: 16,
          ),
        ),
        Text(
          (isShowingBalance)
              ? "R\$ ${userBalance.toStringAsFixed(2)}"
              : "R\$ ●●●●",
          style: TextStyle(
            color: widget.color,
            fontSize: 32,
          ),
        ),
      ],
    );
  }

  onVisibilityBalanceClicked() {
    if (isShowingBalance) {
      setState(() {
        isShowingBalance = false;
      });
    } else {
      balanceService.hasPin(userId: widget.userId).then(
        (bool hasPin) {
          if (hasPin) {
            showPinDialog(context, isRegister: false).then((String? pin) {
              if (pin != null) {
                balanceService
                    .getBalance(userId: widget.userId, pin: pin)
                    .then((double balance) {
                  setState(() {
                    isShowingBalance = true;
                    userBalance = balance;
                  });
                });
              }
            });
          } else {
            showPinDialog(context, isRegister: true).then((String? pin) {
              if (pin != null) {
                balanceService
                    .createPin(userId: widget.userId, pin: pin)
                    .then((double balance) {
                  setState(() {
                    isShowingBalance = true;
                    userBalance = balance;
                  });
                });
              }
            });
          }
        },
      );
    }
  }
}
