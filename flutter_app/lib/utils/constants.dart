// flutter_app/lib/utils/constants.dart

class Constants {
  // App related constants
  static const String APP_NAME = 'Bumble Clone';

  // Database related constants
  static const String USERS_COLLECTION = 'users';
  static const String CHATS_COLLECTION = 'chats';
  static const String MATCHES_COLLECTION = 'matches';

  // Field names
  static const String USER_ID_FIELD = 'userId';
  static const String EMAIL_FIELD = 'email';
  static const String PASSWORD_FIELD = 'password';
  static const String NAME_FIELD = 'name';
  static const String AGE_FIELD = 'age';
  static const String GENDER_FIELD = 'gender';
  static const String INTERESTS_FIELD = 'interests';
  static const String MATCH_ID_FIELD = 'matchId';
  static const String CHAT_ID_FIELD = 'chatId';
  static const String MESSAGE_FIELD = 'message';
  static const String TIMESTAMP_FIELD = 'timestamp';

  // Error messages
  static const String INVALID_EMAIL_ERROR = 'Please enter a valid email';
  static const String EMPTY_FIELD_ERROR = 'This field cannot be empty';
  static const String PASSWORD_LENGTH_ERROR = 'Password must be at least 6 characters long';
}
