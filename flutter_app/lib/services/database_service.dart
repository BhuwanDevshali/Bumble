import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/models/chat.dart';
import 'package:flutter_app/models/match.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User> getUser(String id) async {
    var snap = await _db.collection('users').doc(id).get();
    return User.fromMap(snap.data());
  }

  Future<Chat> getChat(String id) async {
    var snap = await _db.collection('chats').doc(id).get();
    return Chat.fromMap(snap.data());
  }

  Future<Match> getMatch(String id) async {
    var snap = await _db.collection('matches').doc(id).get();
    return Match.fromMap(snap.data());
  }

  Stream<List<User>> streamUsers() {
    return _db.collection('users').snapshots().map((snap) {
      return snap.docs.map((doc) => User.fromMap(doc.data())).toList();
    });
  }

  Stream<List<Chat>> streamChats() {
    return _db.collection('chats').snapshots().map((snap) {
      return snap.docs.map((doc) => Chat.fromMap(doc.data())).toList();
    });
  }

  Stream<List<Match>> streamMatches() {
    return _db.collection('matches').snapshots().map((snap) {
      return snap.docs.map((doc) => Match.fromMap(doc.data())).toList();
    });
  }

  Future<void> updateUser(User user) {
    return _db.collection('users').doc(user.id).update(user.toMap());
  }

  Future<void> updateChat(Chat chat) {
    return _db.collection('chats').doc(chat.id).update(chat.toMap());
  }

  Future<void> updateMatch(Match match) {
    return _db.collection('matches').doc(match.id).update(match.toMap());
  }
}