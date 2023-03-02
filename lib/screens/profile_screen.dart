import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:budget_management/widget/profile_menu_card.dart';
import 'package:flutter/material.dart';

import '../widget/person_details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Profile",
        leading: BackIconButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: PersonDetailsCard(),
              ),
              SizedBox(
                height: 16,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileMenuCard(
                    title: "250",
                    subtitle: "total transaction",
                    onTap: () =>
                        Navigator.of(context).pushNamed(EXPENSES_LIST_SCREEN),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
