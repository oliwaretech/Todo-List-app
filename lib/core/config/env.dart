import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String firebaseOptionApiKey = dotenv.env['FIREBASE_OPTION_API_KEY']!;
  static String firebaseOptionAndroidAppId = dotenv.env['FIREBASE_OPTION_ANDROID_APP_ID']!;
  static String firebaseOptionIosAppId = dotenv.env['FIREBASE_OPTION_IOS_APP_ID']!;
  static String firebaseOptionMessagingSenderId = dotenv.env['FIREBASE_OPTION_MESSAGING_SENDER_ID']!;
  static String firebaseOptionStorageBucket = dotenv.env['FIREBASE_OPTION_STORAGE_BUCKET']!;
  static String firebaseOptionProjectId = dotenv.env['FIREBASE_OPTION_PROJECT_ID']!;
}