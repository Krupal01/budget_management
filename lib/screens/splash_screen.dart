import 'dart:async';

import 'package:budget_management/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5) ,()=>Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: const Image(image: AssetImage("assets/images/full_logo.png"),),
    );
  }
}
