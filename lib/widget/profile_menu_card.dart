import 'package:budget_management/model/json_formatted.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  final ProfileTabs profileTab;
  final Function(ProfileTabs)? onTap;

  ProfileMenuCard({required this.profileTab, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!(profileTab);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                profileTab.icon,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                profileTab.title,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
