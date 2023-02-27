import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widget/PrimaryTextButton.dart';
import '../widget/RoundedPrimaryButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;
  String? _passwordErrorText2;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Image(image: AssetImage("assets/images/full_logo.png"),height: 300,fit: BoxFit.fitWidth),
                SizedBox(height: 30),
                Text("Sign Up" , style: primaryTextStyles['24_bold'],),
                SizedBox(height: 16.0),
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: _emailErrorText,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _emailErrorText = validateEmail(value);
                    });
                  },
                ),
                SizedBox(height: 16.0),
                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _passwordErrorText,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _passwordErrorText = validatePassword(value);
                    });
                  },
                ),
                SizedBox(height: 16.0),
                // Password field
                TextFormField(
                  controller: _passwordController2,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    errorText: _passwordErrorText2,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _passwordErrorText2 = validatePassword(value);
                    });
                  },
                ),
                SizedBox(height: 32.0),
                // Login button
                RoundedPrimaryButton(
                  onPressed: _submitForm,
                  buttonText: "Signup",
                ),
                PrimaryTextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, buttonText: "login ?",textStyle: primaryTextStyles['14_normal'],),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Authenticate user with email and password
      print('Login successful');
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!isValidEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!isValidPassword(value)) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
