import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WTF',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Apple Page'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Image Row"),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8aY8kNsEkB5m5-bX0hdDquh9M8OIJ0oVnXQ&s",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROg3Gygefbfhql5BqLlXmcU2_gqtgnqo5c7g&s",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://www.usatoday.com/gcdn/presto/2022/04/01/USAT/0870a9af-68fe-4aea-8ee6-855d7bafbe6b-XXX_D03_WOZNIAK_10_TECH.JPG?width=700&height=487&fit=crop&format=pjpg&auto=webp",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 20), 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Image Column"),
                Image.network(
                  "https://www.usatoday.com/gcdn/presto/2022/04/01/USAT/0870a9af-68fe-4aea-8ee6-855d7bafbe6b-XXX_D03_WOZNIAK_10_TECH.JPG?width=700&height=487&fit=crop&format=pjpg&auto=webp",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://www.usatoday.com/gcdn/presto/2022/04/01/USAT/0870a9af-68fe-4aea-8ee6-855d7bafbe6b-XXX_D03_WOZNIAK_10_TECH.JPG?width=700&height=487&fit=crop&format=pjpg&auto=webp",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://www.usatoday.com/gcdn/presto/2022/04/01/USAT/0870a9af-68fe-4aea-8ee6-855d7bafbe6b-XXX_D03_WOZNIAK_10_TECH.JPG?width=700&height=487&fit=crop&format=pjpg&auto=webp",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
