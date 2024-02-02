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
    apiKey: 'AIzaSyBo14RHaCWb9wSzUmc-pAs7Innm5wn9TKk',
    appId: '1:876517671466:web:5102030484248beb8db953',
    messagingSenderId: '876517671466',
    projectId: 'vnpa-bk-car-manager',
    authDomain: 'vnpa-bk-car-manager.firebaseapp.com',
    storageBucket: 'vnpa-bk-car-manager.appspot.com',
    measurementId: 'G-MDH3TFCX77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDw5l5tr76FF-TQzGPk8AYrCwXOg9QHGis',
    appId: '1:876517671466:android:8ad5707442a3b6f98db953',
    messagingSenderId: '876517671466',
    projectId: 'vnpa-bk-car-manager',
    storageBucket: 'vnpa-bk-car-manager.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWz_1_Ls7m6v28Z8qdUzmFm_OrAiB3I08',
    appId: '1:876517671466:ios:0a98bd84eab063768db953',
    messagingSenderId: '876517671466',
    projectId: 'vnpa-bk-car-manager',
    storageBucket: 'vnpa-bk-car-manager.appspot.com',
    iosBundleId: 'com.vnpabk.carManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWz_1_Ls7m6v28Z8qdUzmFm_OrAiB3I08',
    appId: '1:876517671466:ios:0a98bd84eab063768db953',
    messagingSenderId: '876517671466',
    projectId: 'vnpa-bk-car-manager',
    storageBucket: 'vnpa-bk-car-manager.appspot.com',
    iosBundleId: 'com.vnpabk.carManager',
  );
}
