import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:budget_management/widget/person_details_card.dart';
import 'package:budget_management/widget/transaction_card.dart';
import 'package:flutter/material.dart';

class PersonDetailScreen extends StatelessWidget {
  const PersonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Details",
        leading: BackIconButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width : double.infinity , height : 150 , child: PersonDetailsCard(),),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => TransactionCard(
                  price: -8.3255122,
                  reason: "reason",
                  dateInMillis: 1677748687000,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
