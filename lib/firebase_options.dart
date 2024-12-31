// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyB1LHZ_3A9fpt4zh9ddLY7PfCU3MGJ4yGM',
    appId: '1:236911169166:web:d57dd64cfbfed83cd403df',
    messagingSenderId: '236911169166',
    projectId: 'first-firebase-project-be4db',
    authDomain: 'first-firebase-project-be4db.firebaseapp.com',
    storageBucket: 'first-firebase-project-be4db.firebasestorage.app',
    measurementId: 'G-H465YBG1TY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOfINMFzYs8ys0LjGCvSSvFDslPW5VbtI',
    appId: '1:236911169166:android:f41456c042b52033d403df',
    messagingSenderId: '236911169166',
    projectId: 'first-firebase-project-be4db',
    storageBucket: 'first-firebase-project-be4db.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCD9ecLCa4_LRhWHZ0GKHQMWB7TAZyHfgM',
    appId: '1:236911169166:ios:f85bb852c1d1e74dd403df',
    messagingSenderId: '236911169166',
    projectId: 'first-firebase-project-be4db',
    storageBucket: 'first-firebase-project-be4db.firebasestorage.app',
    iosBundleId: 'com.rf.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCD9ecLCa4_LRhWHZ0GKHQMWB7TAZyHfgM',
    appId: '1:236911169166:ios:f85bb852c1d1e74dd403df',
    messagingSenderId: '236911169166',
    projectId: 'first-firebase-project-be4db',
    storageBucket: 'first-firebase-project-be4db.firebasestorage.app',
    iosBundleId: 'com.rf.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB1LHZ_3A9fpt4zh9ddLY7PfCU3MGJ4yGM',
    appId: '1:236911169166:web:7d4f68055d6e95c2d403df',
    messagingSenderId: '236911169166',
    projectId: 'first-firebase-project-be4db',
    authDomain: 'first-firebase-project-be4db.firebaseapp.com',
    storageBucket: 'first-firebase-project-be4db.firebasestorage.app',
    measurementId: 'G-HN5WD2BYXP',
  );
}