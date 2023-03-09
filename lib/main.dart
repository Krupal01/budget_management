import 'package:budget_management/data/local_service.dart';
import 'package:budget_management/routes.dart';
import 'package:budget_management/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(routes: Routes(LocalService()),));
}

class MyApp extends StatelessWidget {
  final Routes routes;
  MyApp({super.key , required this.routes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      initialRoute: SPLASH_SCREEN,
      onGenerateRoute: (settings) => routes.onGenerateRoutes(settings),
    );
  }
}
