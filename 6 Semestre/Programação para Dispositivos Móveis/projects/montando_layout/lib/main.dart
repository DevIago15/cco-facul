import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error Analog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center, 
          children: [
            Container(
              width: 320,
              height: 270,
              color: const Color.fromARGB(255, 180, 180, 180), 
            ),
            Container(
              width: 300,
              height: 250,
              color: const Color.fromARGB(255, 51, 50, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Check Signal Cable',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: containersCima(),
                  ),
                  const SizedBox(height: 20),
                  ...containerBaixo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> containersCima() {
    return [
      Container(width: 20, height: 20, decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(5),
      ), ),
      Container(width: 20, height: 20, decoration: BoxDecoration(
         color: Colors.green,
         borderRadius: BorderRadius.circular(5)
         ),
      ),
      Container(width: 20, height: 20, decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5)
      ), ),
    ];
  }

  List<Widget> containerBaixo() {
    return [
      Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 91, 91, 91),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Analog',
            style: TextStyle(color:  Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    ];
  }
}
