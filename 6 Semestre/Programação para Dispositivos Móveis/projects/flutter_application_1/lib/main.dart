import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// flutter pub get

class MyApp extends StatelessWidget { // herdeiro do myapp
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Iago Detona Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget { // gerenciamento de estado -> stateful e stateless
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if(_counter >= 100){
        _counter;
      } else{
        _counter++;
      }

    });
  }

    void _discCount() {
    setState(() {
      if(_counter <= 0){
        _counter = 0;
      } else {
      _counter--;
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Aperte quantas x vc quer me dar uma mamada',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add),),
          SizedBox(width: 16),
          FloatingActionButton(onPressed: _discCount, tooltip: 'Discrement', child: const Icon(Icons.remove))
          ],
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
