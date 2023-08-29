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
      apiKey: 'AIzaSyDuyjJ1hJzVW3f_svK_VVvpgi27ptNjpGU',
      authDomain: 'fumiko-41323672.firebaseapp.com',
      databaseURL:
          'https://fumiko-41323672-default-rtdb.europe-west1.firebasedatabase.app',
      projectId: 'fumiko-41323672',
      storageBucket: 'fumiko-41323672.appspot.com',
      messagingSenderId: '23354687373',
      appId: '1:23354687373:web:0263c054c16e852f0f07c4',
      measurementId: 'G-LLTNQFXZ90');

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2x5XgbcwVShXIsddOlq7qO7cFWkhInfg',
    appId: '1:23354687373:android:26e47ea0f5b9259a0f07c4',
    messagingSenderId: '23354687373',
    projectId: 'fumiko-41323672',
    databaseURL:
        'https://fumiko-41323672-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fumiko-41323672.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwmnBKWMzau_NvlpdlfQQKD9zA-Ad36ug',
    appId: '1:23354687373:ios:71ff03142d8ba43d0f07c4',
    messagingSenderId: '23354687373',
    projectId: 'fumiko-41323672',
    databaseURL:
        'https://fumiko-41323672-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fumiko-41323672.appspot.com',
    iosClientId:
        '23354687373-ho82gbuholstpbo9r5itocl44qlc7rbi.apps.googleusercontent.com',
    iosBundleId: 'com.example.fumikov4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwmnBKWMzau_NvlpdlfQQKD9zA-Ad36ug',
    appId: '1:23354687373:ios:1ba0f7e34c42d7440f07c4',
    messagingSenderId: '23354687373',
    projectId: 'fumiko-41323672',
    databaseURL:
        'https://fumiko-41323672-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fumiko-41323672.appspot.com',
    iosClientId:
        '23354687373-31j6c0bblv5g8uieb07itibvcfrt4p5h.apps.googleusercontent.com',
    iosBundleId: 'com.example.fumikov4.RunnerTests',
  );
}
