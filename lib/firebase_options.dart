import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyD3ZPAKGDWKXUPrmijsa2hcMH8pOgx6haw',
    appId: '1:967299742878:web:e9b179827d807845044f8f',
    messagingSenderId: '967299742878',
    projectId: 'alse-7320e',
    authDomain: 'alse-7320e.firebaseapp.com',
    storageBucket: 'alse-7320e.firebasestorage.app',
    measurementId: 'G-GY84TXQR32',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXYVKgLO6u_MI03rbCCJjc8qmmGe9_zu8',
    appId: '1:967299742878:android:1589a10a64ee0aba044f8f',
    messagingSenderId: '967299742878',
    projectId: 'alse-7320e',
    storageBucket: 'alse-7320e.firebasestorage.app',
  );
}
