// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCgKBc8QTTMLhkGXVP46Q6RWMNmWbS_4mk',
    appId: '1:365506241472:web:61fd50f5cb42209b70de25',
    messagingSenderId: '365506241472',
    projectId: 'generic-a01f7',
    authDomain: 'generic-a01f7.firebaseapp.com',
    storageBucket: 'generic-a01f7.appspot.com',
    measurementId: 'G-JSLDBRKY1V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDmBnJmi6oI5BpY2xMa-Pn5xlEPlwhsNs',
    appId: '1:365506241472:android:98878d294c84df9d70de25',
    messagingSenderId: '365506241472',
    projectId: 'generic-a01f7',
    storageBucket: 'generic-a01f7.appspot.com',
  );
}
