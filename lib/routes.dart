import 'package:budget_management/screens/dash_board_screen.dart';
import 'package:budget_management/screens/expenses_list_screen.dart';
import 'package:budget_management/screens/forgot_password_screen.dart';
import 'package:budget_management/screens/login_screen.dart';
import 'package:budget_management/screens/mobile_verification_screen.dart';
import 'package:budget_management/screens/person_details_screen.dart';
import 'package:budget_management/screens/profile_screen.dart';
import 'package:budget_management/screens/signup_screen.dart';
import 'package:budget_management/screens/splash_screen.dart';
import 'package:budget_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes{

  Route? onGenerateRoutes(RouteSettings settings){

    switch(settings.name){
      case SPLASH_SCREEN : return MaterialPageRoute(builder: (context) => const SplashScreen(),);
      case LOGIN_SCREEN : return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      case SIGNUP_SCREEN : return MaterialPageRoute(builder: (context) => SignUpScreen(),);
      case FORGOT_PASSWORD_SCREEN : return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      case MOBILE_VERIFICATION_SCREEN : return MaterialPageRoute(builder: (context) => MobileVerificationScreen(),);
      case DASHBOARD_SCREEN : return MaterialPageRoute(builder: (context) => DashboardScreen(),);
      case PROFILE_SCREEN : return MaterialPageRoute(builder: (context) => ProfileScreen(),);
      case PERSON_DETAIL_SCREEN : return MaterialPageRoute(builder: (context) => PersonDetailScreen(),);
      case EXPENSES_LIST_SCREEN : return MaterialPageRoute(builder: (context) => ExpensesListScreen(),);
    }
    return null;
  }
}