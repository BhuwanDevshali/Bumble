import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/chat.dart';
import 'package:flutter_app/utils/constants.dart';

class ChatService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> sendChatMessage(Chat chat) async {
    await _db.collection(Collections.CHATS).add(chat.toMap());
  }

  static Stream<List<Chat>> getChatMessages(String chatId) {
    return _db
        .collection(Collections.CHATS)
        .where('chatId', isEqualTo: chatId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((query) => query.docs.map((doc) => Chat.fromMap(doc.data())).toList());
  }
}