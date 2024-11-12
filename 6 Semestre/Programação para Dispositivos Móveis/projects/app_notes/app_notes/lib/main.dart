import 'package:flutter/material.dart';
import 'package:app_notes/screens/home_screens.dart';
import 'package:firebase_core/firebase_core.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "",
      appId: "", //Id Aplicativo (Ex: 1:291124591333:android:0f52df5d6ed45c3c22437b)
      messagingSenderId: "", //numero do projeto
      projectId: "", //codigo do projeto
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
      title: 'Bedrock Notes',
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
