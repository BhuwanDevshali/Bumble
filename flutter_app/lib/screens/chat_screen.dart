import 'package:flutter/material.dart';
import 'package:flutter_app/models/chat.dart';
import 'package:flutter_app/services/chat_service.dart';
import 'package:flutter_app/widgets/chat_card.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> _chats = [];

  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  _loadChats() async {
    List<Chat> chats = await ChatService.getChats();
    setState(() {
      _chats = chats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          return ChatCard(chat: _chats[index]);
        },
      ),
    );
  }
}