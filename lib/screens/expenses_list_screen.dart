import 'package:budget_management/bloc/participant_cubit.dart';
import 'package:budget_management/bloc/transaction_cubit.dart';
import 'package:budget_management/bloc/user_cubit.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/json_formatted.dart';
import '../widget/person_card.dart';

class ExpensesListScreen extends StatelessWidget {
  final ProfileTabs profileTabs;

  const ExpensesListScreen({Key? key, required this.profileTabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: profileTabs.title,
        leading: BackIconButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: BlocProvider.of<UserCubit>(context),
            ),
            BlocProvider.value(
              value: BlocProvider.of<ParticipantCubit>(context),
            ),
            BlocProvider.value(
              value: BlocProvider.of<TransactionCubit>(context),
            ),
          ],
          child: ChildExpensesListScreen(profileTabs: profileTabs),
        ),
      ),
    );
  }
}

class ChildExpensesListScreen extends StatelessWidget {
  final ProfileTabs profileTabs;

  const ChildExpensesListScreen({Key? key, required this.profileTabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (profileTabs) {

      case ProfileTabs.total_transaction:
        BlocProvider.of<TransactionCubit>(context).getTransactions(1);
        return BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case TransactionError:
                return Center(
                  child: Text(
                    (state as TransactionError).errorMessage,
                    style: errorText,
                  ),
                );
                break;
              case TransactionLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case TransactionListGetSuccess:
                var currentState = state as TransactionListGetSuccess;
                return ListView.builder(
                  itemCount: currentState.transactions?.length??0,
                  itemBuilder: (context, index) => TransactionCard(
                    price: currentState.transactions?[index]?.price,
                    reason: currentState.transactions?[index]?.reason,
                    date: currentState.transactions?[index]?.date,
                  ),
                );
              default:
                return Center(
                  child: Text(
                    'Something wrong',
                    style: errorText,
                  ),
                );
            }
          },
        );
        break;

      case ProfileTabs.total_participants:
        BlocProvider.of<ParticipantCubit>(context).getParticipants(1);
        return BlocBuilder<ParticipantCubit, ParticipantState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ParticipantError:
                return Center(
                  child: Text(
                    (state as ParticipantError).errorMessage,
                    style: errorText,
                  ),
                );
                break;
              case ParticipantLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ParticipantListGetSuccess:
                var participants = (state as ParticipantListGetSuccess).participants;
                return ListView.builder(
                  itemCount: participants.length,
                  itemBuilder: (context, index) => PersonCard(
                      number: ((participants[index]?.payprice ?? 0) -
                          (participants[index]?.claimprice ?? 0)),
                      name: participants[index]?.name ?? "null",
                      redNumber: participants[index]?.payprice ?? 0,
                      greenNumber: participants[index]?.claimprice ?? 0,
                  ),
                );
              default:
                return Center(
                  child: Text(
                    'Something wrong',
                    style: errorText,
                  ),
                );
            }
          },
        );
        break;

      case ProfileTabs.total_pay:
        BlocProvider.of<TransactionCubit>(context).getPaysTransactions(1);
        return BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case TransactionError:
                return Center(
                  child: Text(
                    (state as TransactionError).errorMessage,
                    style: errorText,
                  ),
                );
                break;
              case TransactionLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case TransactionListGetSuccess:
                var currentState = state as TransactionListGetSuccess;
                return ListView.builder(
                  itemCount: currentState.transactions?.length??0,
                  itemBuilder: (context, index) => TransactionCard(
                    price: currentState.transactions?[index]?.price,
                    reason: currentState.transactions?[index]?.reason,
                    date: currentState.transactions?[index]?.date,
                  ),
                );
              default:
                return Center(
                  child: Text(
                    'Something wrong',
                    style: errorText,
                  ),
                );
            }
          },
        );
        break;

      case ProfileTabs.total_claims:
        BlocProvider.of<TransactionCubit>(context).getClaimsTransactions(1);
        return BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case TransactionError:
                return Center(
                  child: Text(
                    (state as TransactionError).errorMessage,
                    style: errorText,
                  ),
                );
                break;
              case TransactionLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case TransactionListGetSuccess:
                var currentState = state as TransactionListGetSuccess;
                return ListView.builder(
                  itemCount: currentState.transactions?.length??0,
                  itemBuilder: (context, index) => TransactionCard(
                    price: currentState.transactions?[index]?.price,
                    reason: currentState.transactions?[index]?.reason,
                    date: currentState.transactions?[index]?.date,
                  ),
                );
              default:
                return Center(
                  child: Text(
                    'Something wrong',
                    style: errorText,
                  ),
                );
            }
          },
        );
        break;
    }
    return Container();
  }
}
