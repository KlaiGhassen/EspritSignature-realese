import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA_6xJwyDv7AbOIrieZ6-RGGBljclV5c2c",
            authDomain: "esprit-signature-za0h0m.firebaseapp.com",
            projectId: "esprit-signature-za0h0m",
            storageBucket: "esprit-signature-za0h0m.appspot.com",
            messagingSenderId: "1093301612468",
            appId: "1:1093301612468:web:831348d32c0300c9824ce1"));
  } else {
    await Firebase.initializeApp();
  }
}
