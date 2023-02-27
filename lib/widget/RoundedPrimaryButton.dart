import 'package:budget_management/utils/styles.dart';
import 'package:flutter/material.dart';

class RoundedPrimaryButton extends StatelessWidget{

  final VoidCallback onPressed;
  final String buttonText;

  const RoundedPrimaryButton({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(360),
          ),
        ),
        textStyle: MaterialStateProperty.all(whiteTextStyles['18_bold']),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 15 , right: 15 , top: 10 , bottom: 10)),
      ),
      child: Text(buttonText),
    );
  }
  
}