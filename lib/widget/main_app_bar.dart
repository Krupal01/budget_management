import 'package:flutter/material.dart';

import '../utils/styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  MainAppBar({required this.title, this.actions , this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: leading,
      centerTitle: true,
      title: Text(title ,  style: primaryTextStyles['24_bold'],),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}