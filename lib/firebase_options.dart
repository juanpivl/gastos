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
    apiKey: 'AIzaSyAWcHp5RnmxD_0e59fsuebK_i5RsZac8M8',
    appId: '1:723771846233:web:0872ed308f035b87878b48',
    messagingSenderId: '723771846233',
    projectId: 'gastos-119fb',
    authDomain: 'gastos-119fb.firebaseapp.com',
    storageBucket: 'gastos-119fb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHY5qrb9kPMq7x2Q3Map22NqDpyGKDLqs',
    appId: '1:723771846233:android:fd4d5a58180a3af7878b48',
    messagingSenderId: '723771846233',
    projectId: 'gastos-119fb',
    storageBucket: 'gastos-119fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiQR9v9vJUIvys3NufNH4npLbA01bAOLk',
    appId: '1:723771846233:ios:ff5a2f62fbaf68e4878b48',
    messagingSenderId: '723771846233',
    projectId: 'gastos-119fb',
    storageBucket: 'gastos-119fb.appspot.com',
    iosClientId: '723771846233-qn24h0skv5j8mukg54kro3s4u8mlp5f4.apps.googleusercontent.com',
    iosBundleId: 'com.example.gastos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiQR9v9vJUIvys3NufNH4npLbA01bAOLk',
    appId: '1:723771846233:ios:ff5a2f62fbaf68e4878b48',
    messagingSenderId: '723771846233',
    projectId: 'gastos-119fb',
    storageBucket: 'gastos-119fb.appspot.com',
    iosClientId: '723771846233-qn24h0skv5j8mukg54kro3s4u8mlp5f4.apps.googleusercontent.com',
    iosBundleId: 'com.example.gastos',
  );
}
