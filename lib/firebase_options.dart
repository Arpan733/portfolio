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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCjfnViDgeFo8XyfZ8VCwen5GQja66eeC8',
    appId: '1:138110556910:web:b196f28d5a7a9579d0b1ff',
    messagingSenderId: '138110556910',
    projectId: 'portfo-c7477',
    authDomain: 'portfo-c7477.firebaseapp.com',
    databaseURL: 'https://portfo-c7477-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'portfo-c7477.appspot.com',
    measurementId: 'G-RDWSHGHM7F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCr80_bPI2199szHYn0heHIqgOy9xbwUME',
    appId: '1:138110556910:android:d5b1fc81e35f1b07d0b1ff',
    messagingSenderId: '138110556910',
    projectId: 'portfo-c7477',
    databaseURL: 'https://portfo-c7477-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'portfo-c7477.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCV0UD6bwjYun0iWNTW_MF4CxVSg8c-c4',
    appId: '1:138110556910:ios:8ca0c124a2e197f5d0b1ff',
    messagingSenderId: '138110556910',
    projectId: 'portfo-c7477',
    databaseURL: 'https://portfo-c7477-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'portfo-c7477.appspot.com',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCV0UD6bwjYun0iWNTW_MF4CxVSg8c-c4',
    appId: '1:138110556910:ios:800d0a7701d8d4abd0b1ff',
    messagingSenderId: '138110556910',
    projectId: 'portfo-c7477',
    databaseURL: 'https://portfo-c7477-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'portfo-c7477.appspot.com',
    iosBundleId: 'com.example.portfolio.RunnerTests',
  );
}
