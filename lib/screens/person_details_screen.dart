import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:flutter/material.dart';

class PersonDetailScreen extends StatelessWidget {
  const PersonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Details" , leading: BackIconButton(),),
      body: Container(),
    );
  }
}
