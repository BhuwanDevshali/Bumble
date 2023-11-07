import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/validators.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bumble Clone',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomTextField(
                      hintText: 'Name',
                      onChanged: (input) => _name = input,
                      validator: (input) => input.trim().isEmpty
                          ? 'Please enter a valid name'
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    CustomTextField(
                      hintText: 'Email',
                      onChanged: (input) => _email = input,
                      validator: (input) => !Validators.isValidEmail(input)
                          ? 'Please enter a valid email'
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    CustomTextField(
                      hintText: 'Password',
                      onChanged: (input) => _password = input,
                      validator: (input) => input.length < 6
                          ? 'Must be at least 6 characters'
                          : null,
                      isPassword: true,
                    ),
                    SizedBox(height: 50.0),
                    CustomButton(
                      buttonText: 'Register',
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}