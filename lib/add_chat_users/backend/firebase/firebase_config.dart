import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDoW_VZDMqsRWDuLD4vYaoqTuCismClTWk",
            authDomain: "hotel-app-627b5.firebaseapp.com",
            projectId: "hotel-app-627b5",
            storageBucket: "hotel-app-627b5.appspot.com",
            messagingSenderId: "192017124430",
            appId: "1:192017124430:web:9b06339252c89a85fbc71f",
            measurementId: "G-W9YS3N27P7"));
  } else {
    await Firebase.initializeApp();
  }
}
