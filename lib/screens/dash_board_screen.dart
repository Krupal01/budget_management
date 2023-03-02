import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/widget/expandable_fab_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:flutter/material.dart';

import '../widget/person_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Dashboard'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: MainDashboardCard(
                  title: "20",
                  description: "20jbhjhj",
                  onTap: () => Navigator.of(context).pushNamed(PROFILE_SCREEN),
                ),
                height: 150,
                width: double.infinity,
              ),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PersonCard(
                  number: -200,
                  name: 'Person Name',
                  redNumber: -10,
                  greenNumber: 10,
                  onTap: () => Navigator.of(context).pushNamed(PERSON_DETAIL_SCREEN),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 70,
        children: [
          ActionButton(
            icon: Icon(Icons.add_comment_rounded),
            onPressed: () {},
          ),
          ActionButton(
            icon: Icon(Icons.add_reaction),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
