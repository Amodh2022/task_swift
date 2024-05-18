import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'FireBase for This Platform is Not Configured for This Project.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtiEz2OwfuXoG9XIaIAh_JMINbkwVTMes',
    appId: '1:550681148862:android:b538ec072665c6ba1c8def',
    messagingSenderId: '550681148862',
    projectId: 'task-swift-1ec1c',
    storageBucket: 'task-swift-1ec1c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2u58JHsL0qL31wUgAIGD6nj_wNSu2CiY',
    appId: '1:550681148862:ios:7a7b1b04280ab96e1c8def',
    messagingSenderId: '550681148862',
    projectId: 'task-swift-1ec1c',
    storageBucket: 'task-swift-1ec1c.appspot.com',
    iosBundleId: 'com.example.taskSwift',
  );
}
