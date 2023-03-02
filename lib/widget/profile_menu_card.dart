import 'package:budget_management/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  ProfileMenuCard({required this.title, required this.subtitle , this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
              Text(
                title,
                style: primaryTextStyles['28_bold'],
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16.0,
                  color : Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
