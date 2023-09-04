import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA6dInotoy2n9Ldz1iLoDgRcWjJPzdBLeM",
            authDomain: "pc-api-4631338836758036940-624.firebaseapp.com",
            projectId: "pc-api-4631338836758036940-624",
            storageBucket: "pc-api-4631338836758036940-624.appspot.com",
            messagingSenderId: "599063883960",
            appId: "1:599063883960:web:2403037671de57ee86444d",
            measurementId: "G-9GJFQHSM3Z"));
  } else {
    await Firebase.initializeApp();
  }
}
