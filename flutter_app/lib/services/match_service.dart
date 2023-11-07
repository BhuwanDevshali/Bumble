import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/match.dart';

class MatchService {
  static const COLLECTION_NAME = 'matches';

  static Future<List<Match>> getMatches(String userId) async {
    QuerySnapshot snapshot = await Firestore.instance
        .collection(COLLECTION_NAME)
        .where('users', arrayContains: userId)
        .getDocuments();

    return snapshot.documents.map((doc) => Match.fromDocument(doc)).toList();
  }

  static Future<void> createMatch(Match match) async {
    await Firestore.instance.collection(COLLECTION_NAME).add(match.toMap());
  }

  static Future<void> deleteMatch(String matchId) async {
    await Firestore.instance.collection(COLLECTION_NAME).document(matchId).delete();
  }
}