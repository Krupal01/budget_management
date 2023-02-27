import 'package:flutter/material.dart';

import '../utils/styles.dart';

class PrimaryTextButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? textStyle;

  const PrimaryTextButton({Key? key,
    required this.onPressed,
    required this.buttonText,
    this.textStyle,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle ?? primaryTextStyles['18_bold'],
      ),
    );
  }
}



