import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Table',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Lucifer da 1h da Manhã"),
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
      ),
      body: SingleChildScrollView(
        // Allow scrolling if image overflows
        child: Center(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Container(
                    width: 250.0, // Set exact width
                    height: 250.0, // Set exact height
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSxNrvqsiRhuSBMinHXYURuACF5w8sbtqSPA&s",
                      fit: BoxFit.cover, // Ensure image fills container
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                            'Error loading image'); // Handle errors gracefully
                      },
                    ),
                  ),
                  Container(
                    width: 250.0, // Set exact width
                    height: 250.0, // Set exact height
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSxNrvqsiRhuSBMinHXYURuACF5w8sbtqSPA&s",
                      fit: BoxFit.cover, // Ensure image fills container
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                            'Error loading image'); // Handle errors gracefully
                      },
                    ),
                  ),
                  Container(
                    width: 250.0, // Set exact width
                    height: 250.0, // Set exact height
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSxNrvqsiRhuSBMinHXYURuACF5w8sbtqSPA&s",
                      fit: BoxFit.cover, // Ensure image fills container
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                            'Error loading image'); // Handle errors gracefully
                      },
                    ),
                  ),                  
                  Container(
                    width: 250.0, // Set exact width
                    height: 250.0, // Set exact height
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSxNrvqsiRhuSBMinHXYURuACF5w8sbtqSPA&s",
                      fit: BoxFit.cover, // Ensure image fills container
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                            'Error loading image'); // Handle errors gracefully
                      },
                    ),
                  ),
                  SizedBox(width: 100),
                  Container(
                    width: 250.0, 
                    height: 250.0, 
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSxNrvqsiRhuSBMinHXYURuACF5w8sbtqSPA&s",
                      fit: BoxFit.cover, // Ensure image fills container
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                            'Error loading image'); // Handle errors gracefully
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
