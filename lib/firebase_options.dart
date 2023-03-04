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
    apiKey: 'AIzaSyAeRLq7ZiORPXz1xDmVu7FXS6nuTrVDR40',
    appId: '1:979665319816:web:19656eb6dd97447447ac3d',
    messagingSenderId: '979665319816',
    projectId: 'fively-ecommerce',
    authDomain: 'fively-ecommerce.firebaseapp.com',
    storageBucket: 'fively-ecommerce.appspot.com',
    measurementId: 'G-2R5S0M47B1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCmZGLDaxm0V5HuGd4jblpmAxxG9_oZVs',
    appId: '1:979665319816:android:6dd04162ed1bae4347ac3d',
    messagingSenderId: '979665319816',
    projectId: 'fively-ecommerce',
    storageBucket: 'fively-ecommerce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9ndA2UVhsQt4aBNh5MT3LS-QLqqKYH3Y',
    appId: '1:979665319816:ios:ee251ce4bd9e76ae47ac3d',
    messagingSenderId: '979665319816',
    projectId: 'fively-ecommerce',
    storageBucket: 'fively-ecommerce.appspot.com',
    iosClientId: '979665319816-igub4rhuo1r2s1qa5862a705qegi1a2q.apps.googleusercontent.com',
    iosBundleId: 'com.example.fivelyEcommerce',
  );
}