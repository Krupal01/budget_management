import 'package:budget_management/utils/styles.dart';
import 'package:flutter/material.dart';

class MainDashboardCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  MainDashboardCard({required this.title, required this.description , this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: whiteTextStyles['40_bold'],
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: whiteTextStyles['18_normal'],
          ),
        ],
            ),
          ),
      ),
    );
  }
}
