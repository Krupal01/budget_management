import 'package:budget_management/bloc/participant_cubit.dart';
import 'package:budget_management/bloc/transaction_cubit.dart';
import 'package:budget_management/bloc/transaction_cubit.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:budget_management/widget/person_details_card.dart';
import 'package:budget_management/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailScreen extends StatefulWidget {
  final int participantId;
  const PersonDetailScreen({Key? key , required this.participantId}) : super(key: key);

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ParticipantCubit>(context).getParticipant(1, widget.participantId); //todo , by-default userId = 1
    return Scaffold(
      appBar: MainAppBar(
        title: "Details",
        leading: BackIconButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<ParticipantCubit, ParticipantState>(
          listener: (context, state){
            if(state is ParticipantGetSuccess){
              BlocProvider.of<TransactionCubit>(context).getTransactionByParticipates(1, state.participant);
            }
          },
          builder: (context, state) {
            if (state is ParticipantGetSuccess) {
              var participant = state.participant;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: PersonDetailsCard(
                      title: participant.name,
                      description: participant.mobile.toString(),
                      price: (participant.payprice??0)+(participant.claimprice??0),
                      payPrice: participant.payprice,
                      claimPrice: participant.claimprice,
                    ),
                  ),
                  BlocBuilder<TransactionCubit, TransactionState>(
                    builder: (context, state) {
                      if (state is TransactionListGetSuccess) {
                        if (state.transactions != null) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.transactions?.length ?? 0,
                              itemBuilder: (context, index) => TransactionCard(
                                price: state.transactions![index]?.price,
                                reason: state.transactions![index]?.reason,
                                date:
                                    state.transactions![index]?.date,
                              ),
                            ),
                          );
                        } else {
                          return Text(
                            'No Transaction',
                            style: errorText,
                          );
                        }
                      } else if (state is TransactionLoading) {
                        return CircularProgressIndicator();
                      } else if (state is TransactionError) {
                        return Text(
                          'something wrong',
                          style: errorText,
                        );
                      } else {
                        return Expanded(
                          child: Container(),
                        );
                      }
                    },
                  ),
                ],
              );
            } else if (state is ParticipantLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Text(
                'something wrong',
                style: errorText,
              );
            }
          },
        ),
      ),
    );
  }
}
