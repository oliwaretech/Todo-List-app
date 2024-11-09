import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/app.dart';
import 'package:todo/core/config/firebase_option_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: DefaultFirebaseOptions.currentPlatform ==
          DefaultFirebaseOptions.android ? 'to-do-list-kambda' : null);
  runApp(ProviderScope(child: App()));
}