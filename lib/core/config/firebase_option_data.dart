

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/core/config/env.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        print('ola soy android'+android.toString());
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static  FirebaseOptions android = FirebaseOptions(
    apiKey: Env.firebaseOptionApiKey,
    appId: Env.firebaseOptionAndroidAppId,
    messagingSenderId: Env.firebaseOptionMessagingSenderId,
    projectId: Env.firebaseOptionProjectId,
    storageBucket: Env.firebaseOptionStorageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.firebaseOptionApiKey,
    appId: Env.firebaseOptionIosAppId,
    messagingSenderId: Env.firebaseOptionMessagingSenderId,
    projectId: Env.firebaseOptionProjectId,
    storageBucket: Env.firebaseOptionStorageBucket,
  );
}
