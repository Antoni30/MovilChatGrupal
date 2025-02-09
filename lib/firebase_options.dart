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
    apiKey: 'AIzaSyAN8SL2JJ-KWqRp8G7UArPkDrkA2X3lUL8',
    appId: '1:780131904067:web:649f078de7e7955c6182f6',
    messagingSenderId: '780131904067',
    projectId: 'chatboot-a9351',
    authDomain: 'chatboot-a9351.firebaseapp.com',
    storageBucket: 'chatboot-a9351.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwWAbGC3WthvSI1aUfbSpukMznNSm_kTg',
    appId: '1:780131904067:android:f43d23053a6399f56182f6',
    messagingSenderId: '780131904067',
    projectId: 'chatboot-a9351',
    storageBucket: 'chatboot-a9351.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAue-Q8T4NHdEfw86UdR_XKxumbh-oOwPI',
    appId: '1:780131904067:ios:16c6bbcbdf03418c6182f6',
    messagingSenderId: '780131904067',
    projectId: 'chatboot-a9351',
    storageBucket: 'chatboot-a9351.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAue-Q8T4NHdEfw86UdR_XKxumbh-oOwPI',
    appId: '1:780131904067:ios:16c6bbcbdf03418c6182f6',
    messagingSenderId: '780131904067',
    projectId: 'chatboot-a9351',
    storageBucket: 'chatboot-a9351.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAN8SL2JJ-KWqRp8G7UArPkDrkA2X3lUL8',
    appId: '1:780131904067:web:1d005f12ad7990d46182f6',
    messagingSenderId: '780131904067',
    projectId: 'chatboot-a9351',
    authDomain: 'chatboot-a9351.firebaseapp.com',
    storageBucket: 'chatboot-a9351.firebasestorage.app',
  );
}
