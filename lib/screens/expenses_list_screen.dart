import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/transaction_card.dart';
import 'package:flutter/material.dart';

class ExpensesListScreen extends StatelessWidget {
  const ExpensesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "title",
        leading: BackIconButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => TransactionCard(
            price: 100,
            reason: "reason",
            dateInMillis: 1642454545,
          ),
        ),
      ),
    );
  }
}
