import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database_service.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_textfield.dart';
import 'package:flutter_app/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  User _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomTextField(
              label: 'Name',
              initialValue: _user.name,
              onSaved: (value) {
                _user.name = value;
              },
            ),
            CustomTextField(
              label: 'Email',
              initialValue: _user.email,
              onSaved: (value) {
                _user.email = value;
              },
            ),
            CustomTextField(
              label: 'Bio',
              initialValue: _user.bio,
              onSaved: (value) {
                _user.bio = value;
              },
            ),
            CustomButton(
              text: 'Save',
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  await DatabaseService.updateUser(_user);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}