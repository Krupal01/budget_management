import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_new , color: Theme.of(context).primaryColor,),
      onPressed: () => Navigator.of(context).pop(),
      color: Colors.white,
    );
  }
}
