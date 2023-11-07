import 'package:flutter/material.dart';
import 'package:flutter_app/models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  ChatCard({this.chat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chat.userAvatarUrl),
        ),
        title: Text(chat.userName),
        subtitle: Text(chat.lastMessage),
        trailing: Text(chat.time),
        onTap: () {
          Navigator.pushNamed(context, '/chat_screen', arguments: chat);
        },
      ),
    );
  }
}