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
    apiKey: 'AIzaSyCCW93C-4oHWqiKK2mH4jBnuaMiqyAG4ms',
    appId: '1:455855695322:web:908939b458b5bb0713cce3',
    messagingSenderId: '455855695322',
    projectId: 'dict-firebase-todo',
    authDomain: 'dict-firebase-todo.firebaseapp.com',
    storageBucket: 'dict-firebase-todo.appspot.com',
    measurementId: 'G-3MZM3FN95B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAb6HYDD93cGj4IQhk6Vs6_LVe-u8IhJY',
    appId: '1:1022872568520:android:67917db15535da4be45bfd',
    messagingSenderId: '1022872568520',
    projectId: 'bootcamp-day13',
    storageBucket: 'bootcamp-day13.appspot.com',
  );
}
