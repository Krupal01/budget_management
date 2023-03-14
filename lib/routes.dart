import 'package:budget_management/data/local_service.dart';
import 'package:budget_management/model/json_formatted.dart';
import 'package:budget_management/screens/add_person_screen.dart';
import 'package:budget_management/screens/add_transaction_screen.dart';
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

import 'bloc/participant_cubit.dart';
import 'bloc/transaction_cubit.dart';
import 'bloc/user_cubit.dart';

class Routes {
  final LocalService localService;
  late UserCubit userCubit;
  late ParticipantCubit participantCubit;
  late TransactionCubit transactionCubit;

  Routes(this.localService) {
    userCubit = UserCubit(localService);
    participantCubit = ParticipantCubit(localService);
    transactionCubit = TransactionCubit(localService);
  }

  Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case SIGNUP_SCREEN:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case FORGOT_PASSWORD_SCREEN:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      case MOBILE_VERIFICATION_SCREEN:
        return MaterialPageRoute(
          builder: (context) => MobileVerificationScreen(),
        );

      case DASHBOARD_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: userCubit,
            child: DashboardScreen(),
          ),
        );
      case PROFILE_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: userCubit,
            child: ProfileScreen(),
          ),
        );
      case PERSON_DETAIL_SCREEN:
        return MaterialPageRoute(
          builder: (context) => PersonDetailScreen(),
        );
      case EXPENSES_LIST_SCREEN:
        return MaterialPageRoute(
          builder: (context) => ExpensesListScreen(),
        );
      case ADD_PERSON_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: participantCubit,
            child: AddPersonScreen(),
          ),
        );
      case ADD_TRANSACTION_SCREEN:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: transactionCubit),
              BlocProvider.value(value: userCubit),
            ],
            child: AddTransactionScreen(),
          ),
        );
    }
    return null;
  }

  static void profile_navigator(ProfileTabs profileTabs) {
    // todo : add screens to navigate
    switch (profileTabs) {
      case ProfileTabs.total_claims:
        break;
      case ProfileTabs.total_participants:
        break;
      case ProfileTabs.total_pay:
        break;
      case ProfileTabs.total_transaction:
        break;
      case ProfileTabs.forgot_password:
        break;
      case ProfileTabs.update_profile:
        break;
      case ProfileTabs.monthly_statement:
        break;
      case ProfileTabs.reset_month:
        break;
    }
  }
}
