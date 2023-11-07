import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(user.profilePicture),
          ListTile(
            title: Text(user.name),
            subtitle: Text(user.bio),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('CHAT'),
                onPressed: () {/* Navigate to chat screen */},
              ),
              FlatButton(
                child: const Text('PROFILE'),
                onPressed: () {/* Navigate to profile screen */},
              ),
            ],
          ),
        ],
      ),
    );
  }
}