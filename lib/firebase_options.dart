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
    apiKey: 'AIzaSyBzSv0dGWJVf8jyDLp5iv9qwmfavqrWkOI',
    appId: '1:664757711677:web:b0302389b5cc78cf760b54',
    messagingSenderId: '664757711677',
    projectId: 'driving-course-83524',
    authDomain: 'driving-course-83524.firebaseapp.com',
    storageBucket: 'driving-course-83524.appspot.com',
    measurementId: 'G-1LE02QDXWL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuTz-IOnv1JbyCYVIKoEyk0PhMVdPNEGA',
    appId: '1:664757711677:android:6db3be2f4090a0fe760b54',
    messagingSenderId: '664757711677',
    projectId: 'driving-course-83524',
    storageBucket: 'driving-course-83524.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMLl2mSrnXCbYPoD3BXYoVwvaRJlszvSw',
    appId: '1:664757711677:ios:6a56b1c133af7287760b54',
    messagingSenderId: '664757711677',
    projectId: 'driving-course-83524',
    storageBucket: 'driving-course-83524.appspot.com',
    iosClientId:
        '664757711677-772lrfoqhqb7903u2ikllhtr7a1i8i2t.apps.googleusercontent.com',
    iosBundleId: 'com.example.driving_question',
  );
}
