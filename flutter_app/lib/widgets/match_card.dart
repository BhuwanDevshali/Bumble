import 'package:flutter/material.dart';
import 'package:flutter_app/models/match.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  MatchCard({this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(match.photoUrl),
        ),
        title: Text(match.name),
        subtitle: Text('Matched on ${match.matchedDate}'),
        trailing: IconButton(
          icon: Icon(Icons.chat),
          onPressed: () {
            Navigator.pushNamed(context, '/chat_screen', arguments: match);
          },
        ),
      ),
    );
  }
}