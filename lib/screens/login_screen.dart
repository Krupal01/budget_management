import 'package:budget_management/utils/constants.dart';
import 'package:budget_management/utils/styles.dart';
import 'package:budget_management/widget/PrimaryTextButton.dart';
import 'package:budget_management/widget/RoundedPrimaryButton.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                Text("Login" , style: primaryTextStyles['24_bold'],),
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
                SizedBox(height: 32.0),
                // Login button
                RoundedPrimaryButton(
                  onPressed: _submitForm,
                  buttonText: "Login",
                ),
                SizedBox(height: 20.0),
                PrimaryTextButton(onPressed: () {

                }, buttonText: "forgot password",textStyle: primaryTextStyles['14_normal'],),
                PrimaryTextButton(onPressed: () {
                  Navigator.of(context).pushNamed(SIGNUP_SCREEN);
                }, buttonText: "Doesn't Have Account? sign up",textStyle: primaryTextStyles['14_normal'],),
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
