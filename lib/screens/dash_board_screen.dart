import 'package:budget_management/model/json_formatted.dart';
import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:budget_management/widget/expandable_fab_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_cubit.dart';
import '../widget/person_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).getUser(1);
    return Scaffold(
      appBar: MainAppBar(title: 'Dashboard'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserGetSuccess) {
                var participants = state.user.getParticipants()?.where((element) => element?.hasTransaction() ?? false).toList();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: MainDashboardCard(
                        title: ((state.user.payprice ?? 0) -
                                (state.user.claimprice ?? 0))
                            .toStringAsFixed(2),
                        description: "Total Expanses",
                        onTap: () =>
                            Navigator.of(context).pushNamed(PROFILE_SCREEN),
                      ),
                    ),
                    (participants == null ||
                            (participants.isEmpty ?? true))
                        ? const Center(
                            child: Text("no participant available"),
                          )
                        : ListView.builder(
                            itemCount: participants.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var participant =
                              participants[index];
                              return PersonCard(
                                number: ((participant?.payprice ?? 0) -
                                    (participant?.claimprice ?? 0)),
                                name: participant?.name ?? "null",
                                redNumber: participant?.payprice ?? 0,
                                greenNumber: participant?.claimprice ?? 0,
                                onTap: () => Navigator.of(context)
                                    .pushNamed(PERSON_DETAIL_SCREEN),
                              );
                            },
                          ),
                  ],
                );
              } else if (state is UserError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: blackTextStyles['16_normal'],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "State Invalid",
                    style: blackTextStyles['16_normal'],
                  ),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 70,
        children: [
          ActionButton(
            icon: const Icon(Icons.add_comment_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed(ADD_TRANSACTION_SCREEN).then((value) => setState((){}));
            },
          ),
          ActionButton(
            icon: const Icon(Icons.add_reaction),
            onPressed: () {
              Navigator.of(context).pushNamed(ADD_PERSON_SCREEN).then((value) => setState((){}));
            },
          ),
        ],
      ),
    );
  }
}
