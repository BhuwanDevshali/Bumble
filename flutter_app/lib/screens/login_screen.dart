import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/validators.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isLoading = false;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => _isLoading = true);
      AuthService.login(_email, _password).then((_) {
        setState(() => _isLoading = false);
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError((err) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error logging in. Please try again.'))
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Bumble Clone', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 30.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        labelText: 'Email',
                        validator: Validators.emailValidator,
                        onSaved: (input) => _email = input,
                      ),
                      SizedBox(height: 20.0),
                      CustomTextField(
                        labelText: 'Password',
                        validator: Validators.passwordValidator,
                        onSaved: (input) => _password = input,
                        isPassword: true,
                      ),
                      SizedBox(height: 40.0),
                      _isLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            buttonText: 'Login',
                            onPressed: _submit,
                          ),
                      SizedBox(height: 20.0),
                      TextButton(
                        child: Text('New user? Register'),
                        onPressed: () => Navigator.pushNamed(context, '/register'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}