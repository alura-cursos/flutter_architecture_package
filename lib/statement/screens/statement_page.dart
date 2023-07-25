import 'package:flutter/material.dart';
import 'package:flutter_bytebank/_core/widgets/height_margin.dart';
import 'package:flutter_bytebank/statement/helpers/generate_fake_transfers.dart';
import 'package:flutter_bytebank/statement/models/transfer_model.dart';
import 'package:flutter_bytebank/statement/widgets/statement_background_widget.dart';
import 'package:flutter_bytebank/statement/widgets/statement_title_widget.dart';
import 'package:flutter_bytebank/statement/widgets/statement_transfers_list_widget.dart';

import '../../_core/constants/bytebank_screens.dart';
import '../../_core/widgets/appbar_widget.dart';
import '../../_core/widgets/drawer_widget.dart';

class StatementPage extends StatefulWidget {
  const StatementPage({super.key});

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  List<TransferModel> listTransfers = [];

  @override
  void initState() {
    listTransfers = generateFakeTransfers(countTransfers: 30, pastDays: 400);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(),
      drawer: getDrawerWidget(
        context: context,
        screen: BytebankScreens.statement,
      ),
      body: StatementBackgroundWidget(
        children: [
          const StatementTitleWidget(),
          const HeightMargin(MarginType.large),
          StatementTransfersListWidget(listTransfers: listTransfers),
        ],
      ),
    );
  }
}
