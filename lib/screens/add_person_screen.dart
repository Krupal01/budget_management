import 'package:budget_management/bloc/participant_cubit.dart';
import 'package:budget_management/model/json_formatted.dart';
import 'package:budget_management/widget/RoundedPrimaryButton.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/constants.dart';

class AddPersonScreen extends StatefulWidget {
  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Please enter a valid 10 digit mobile number';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Authenticate user with email and password
      BlocProvider.of<ParticipantCubit>(context).addParticipant(
        1,
        Participant(name: _nameController.value.text, mobile: int.parse(_mobileController.value.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Add Person',
        leading: const BackIconButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                controller: _nameController,
                validator: _validateName,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                ),
                keyboardType: TextInputType.phone,
                controller: _mobileController,
                validator: _validateMobile,
              ),
              const SizedBox(
                height: 16.0,
              ),
              RoundedPrimaryButton(
                onPressed: _submitForm,
                buttonText: 'Submit',
              ),
              BlocConsumer<ParticipantCubit , ParticipantState>(
                builder: (context, state) {
                  if (state is ParticipantLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ParticipantError) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    );
                  } else {
                    return Container();
                  }
                },
                listener: (context, state) {
                  if (state is ParticipantAddSuccess) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
