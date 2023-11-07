```dart
class Match {
  final String id;
  final String userId;
  final String matchId;
  final DateTime matchedOn;

  Match({this.id, this.userId, this.matchId, this.matchedOn});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['_id'],
      userId: json['userId'],
      matchId: json['matchId'],
      matchedOn: DateTime.parse(json['matchedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'matchId': matchId,
      'matchedOn': matchedOn.toIso8601String(),
    };
  }
}
```