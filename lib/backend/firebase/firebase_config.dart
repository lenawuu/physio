import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCBKds2XjPEtqZk_VgZd8lgJsfhnqFAsJw",
            authDomain: "ptapp-2a172.firebaseapp.com",
            projectId: "ptapp-2a172",
            storageBucket: "ptapp-2a172.appspot.com",
            messagingSenderId: "985870369370",
            appId: "1:985870369370:web:b12e22e483d9bc26c04e63",
            measurementId: "G-CJGKC3YJ5B"));
  } else {
    await Firebase.initializeApp();
  }
}
