```dart
class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String profilePicture;
  final String bio;
  final String location;
  final String gender;
  final String interestedIn;
  final DateTime dateOfBirth;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.bio,
    this.location,
    this.gender,
    this.interestedIn,
    this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      profilePicture: json['profilePicture'],
      bio: json['bio'],
      location: json['location'],
      gender: json['gender'],
      interestedIn: json['interestedIn'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'bio': bio,
      'location': location,
      'gender': gender,
      'interestedIn': interestedIn,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }
}
```