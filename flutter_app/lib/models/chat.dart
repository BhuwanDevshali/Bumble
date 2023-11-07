```dart
class Chat {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  Chat({this.id, this.senderId, this.receiverId, this.message, this.timestamp});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
```