import 'package:flutter/material.dart';
import '../screens/home_screens.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBcBCKW2bv_1c28218p7tHDlSD4KOu3e44",
      appId: "1:291124591394:android:0f52df5d8ed40c3c22437b", //Id Aplicativo
      messagingSenderId: "291124591394", //numero do projeto
      projectId: "cco20242", //codigo do projeto
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCO Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      //home: const LoginScreen(),
      home: const HomeScreen(),
    );
  }
}
