import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widget/RoundedPrimaryButton.dart';
import '../widget/back_icon_button.dart';
import '../widget/main_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  String? _validateNewPassword(String? value) {
    if (value!.isEmpty) {
      return 'New password is required.';
    }
    // add your custom validation logic here
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return 'Confirm password is required.';
    }
    if (value != _newPasswordController.text) {
      return 'Passwords do not match.';
    }
    // add your custom validation logic here
    return null;
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Authenticate user with email and password
      print('Password reset successful');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Generate Password",
        leading: BackIconButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _obscureNewPassword,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNewPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _toggleNewPasswordVisibility,
                    ),
                  ),
                  validator: _validateNewPassword,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _toggleConfirmPasswordVisibility,
                    ),
                  ),
                  validator: _validateConfirmPassword,
                ),
                SizedBox(height: 16.0),
                RoundedPrimaryButton(
                  onPressed: _submitForm,
                  buttonText: "Submit",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}