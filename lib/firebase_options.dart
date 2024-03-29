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
    apiKey: 'AIzaSyBqreoU9-SuLDAIXFSTeaO9goLM1IN6uY8',
    appId: '1:363089986677:web:cf4b13c784f43c6688a43c',
    messagingSenderId: '363089986677',
    projectId: 'yuutebrok-e03d0',
    authDomain: 'yuutebrok-e03d0.firebaseapp.com',
    storageBucket: 'yuutebrok-e03d0.appspot.com',
    measurementId: 'G-N33NN3S993',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvLxClg1WrQyYgN0jMQSJvkQArQ1wKReM',
    appId: '1:363089986677:android:814a02c64b8f9e6088a43c',
    messagingSenderId: '363089986677',
    projectId: 'yuutebrok-e03d0',
    storageBucket: 'yuutebrok-e03d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGj0Ub0BaF7LHgNSIdwaqW-U-yofuRI0M',
    appId: '1:363089986677:ios:9fa46fe292904cce88a43c',
    messagingSenderId: '363089986677',
    projectId: 'yuutebrok-e03d0',
    storageBucket: 'yuutebrok-e03d0.appspot.com',
    iosBundleId: 'com.example.yuutebrok',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGj0Ub0BaF7LHgNSIdwaqW-U-yofuRI0M',
    appId: '1:363089986677:ios:8e4bf48714427f9088a43c',
    messagingSenderId: '363089986677',
    projectId: 'yuutebrok-e03d0',
    storageBucket: 'yuutebrok-e03d0.appspot.com',
    iosBundleId: 'com.example.yuutebrok.RunnerTests',
  );
}
