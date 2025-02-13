// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// / Default [FirebaseOptions] for use with your Firebase apps.
// /
// / Example:
// / ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
// / ```
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
        return windows;
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
    apiKey: 'AIzaSyBml2R__y_QTWiK3Vj5daotEyZRX93kJzQ',
    appId: '1:255697135180:web:c8fd773a92691e27d476e9',
    messagingSenderId: '255697135180',
    projectId: 'helphive-32deb',
    authDomain: 'helphive-32deb.firebaseapp.com',
    storageBucket: 'helphive-32deb.appspot.com',
    measurementId: 'G-XX2MXH9Q6G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACrL2cQ6D_qUh--bShsvkXaxi6shohcHM',
    appId: '1:255697135180:android:c009213f640a828dd476e9',
    messagingSenderId: '255697135180',
    projectId: 'helphive-32deb',
    storageBucket: 'helphive-32deb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZEeiZls3tkN1vZLHli6IbeMnCZkPzAfY',
    appId: '1:255697135180:ios:b5becb5c7708c032d476e9',
    messagingSenderId: '255697135180',
    projectId: 'helphive-32deb',
    storageBucket: 'helphive-32deb.appspot.com',
    iosBundleId: 'com.example.helpHive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZEeiZls3tkN1vZLHli6IbeMnCZkPzAfY',
    appId: '1:255697135180:ios:b5becb5c7708c032d476e9',
    messagingSenderId: '255697135180',
    projectId: 'helphive-32deb',
    storageBucket: 'helphive-32deb.appspot.com',
    iosBundleId: 'com.example.helpHive',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBml2R__y_QTWiK3Vj5daotEyZRX93kJzQ',
    appId: '1:255697135180:web:4b5bf3cdc81a76d6d476e9',
    messagingSenderId: '255697135180',
    projectId: 'helphive-32deb',
    authDomain: 'helphive-32deb.firebaseapp.com',
    storageBucket: 'helphive-32deb.appspot.com',
    measurementId: 'G-D63ZKRXN9N',
  );
}
