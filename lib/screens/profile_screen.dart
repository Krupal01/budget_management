import 'package:budget_management/bloc/user_cubit.dart';
import 'package:budget_management/model/json_formatted.dart';
import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:budget_management/widget/main_dashboard_card.dart';
import 'package:budget_management/widget/profile_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';
import '../widget/person_details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).getUser(1);
    return Scaffold(
      appBar: MainAppBar(
        title: "Profile",
        leading: BackIconButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<UserCubit,UserState>(
                builder: (context, state) {
                  if(state is UserGetSuccess){
                    var user = state.user;
                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: PersonDetailsCard(
                        title: user.name,
                        description: user.mobile.toString(),
                        price: (user.payprice??0)+(user.claimprice??0),
                        payPrice: user.payprice,
                        claimPrice: user.claimprice,
                      ),
                    );
                  }
                  else if(state is UserLoading){
                    return CircularProgressIndicator();
                  }
                  else if(state is UserError){
                    return Text('Something wrong' , style: errorText,);
                  }
                  else {
                    return SizedBox(width: double.infinity,
                      height: 150,child: PersonDetailsCard(),);
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                itemCount: ProfileTabs.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileMenuCard(
                    profileTab : ProfileTabs.values[index],
                    onTap: (p0){
                      Routes.profile_navigator(context , p0); //todo : no screen to navigate for now
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
