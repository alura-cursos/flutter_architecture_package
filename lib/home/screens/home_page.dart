import 'package:flutter/material.dart';
import 'package:flutter_bytebank/_core/constants/bytebank_colors.dart';
import 'package:flutter_bytebank/_core/constants/bytebank_screens.dart';
import 'package:flutter_bytebank/_core/widgets/appbar_widget.dart';
import 'package:flutter_bytebank/_core/widgets/drawer_widget.dart';
import 'package:flutter_bytebank/_core/widgets/balance_widget.dart';
import 'package:flutter_bytebank/home/widgets/home_background_widget.dart';
import 'package:flutter_bytebank/home/widgets/home_title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(),
      drawer: getDrawerWidget(
        context: context,
        screen: BytebankScreens.home,
      ),
      body: const HomeBackgroundWidget(
        children: [
          HomeTitleWidget(),
          BalanceWidget(color: BytebankColors.white),
        ],
      ),
    );
  }
}
