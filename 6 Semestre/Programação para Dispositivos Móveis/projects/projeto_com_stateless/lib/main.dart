import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: meuWidget(),
        ),
      ),
    );
  }

  Widget meuWidget(){
    return FloatingActionButton(child: Icon(Icons.warning), backgroundColor: Colors.green, onPressed: AlertDialog.new,);
  }
}

