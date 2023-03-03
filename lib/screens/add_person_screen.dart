import 'package:budget_management/widget/RoundedPrimaryButton.dart';
import 'package:budget_management/widget/back_icon_button.dart';
import 'package:budget_management/widget/main_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

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
      print('Person Added successful');
      Navigator.of(context).pushReplacementNamed(DASHBOARD_SCREEN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Add Person' , leading: BackIconButton(),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                controller: _nameController,
                validator: _validateName,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mobile',
                ),
                keyboardType: TextInputType.phone,
                controller: _mobileController,
                validator: _validateMobile,
                ),
              SizedBox(
                height: 16.0,
              ),
              RoundedPrimaryButton(onPressed: _submitForm, buttonText: 'Submit',),
            ],
          ),
        ),
      ),
    );
  }
}

