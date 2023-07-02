import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store/app.dart';

//TODO configure apple app
//TODO add text styles
//TODO add code gen for assets
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyA8g3OUbShXVmkYj8255MqOli25rS3osxM',
    appId: '1:26892132028:android:84a409a233b4ad00b0fab9',
    messagingSenderId: '26892132028	',
    projectId: 'store-429e8',
    storageBucket: 'store-429e8.appspot.com',
  ));
  runApp(MyApp());
}
