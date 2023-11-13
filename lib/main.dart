import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(37),
          child: AppBar(
            backgroundColor: Colors.red,
            elevation: 0.0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFb7b6b6), // Gray color in hex
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo Placeholder
                    Container(
                      width: 150, // Set your desired width
                      height: 50, // Set your desired height
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/logo_text.png'), // Replace with your logo
                        ),
                      ),
                    ),
                    // Profile Icon and Name
                    const Row(
                      children: [
                        Icon(
                          Icons.person_rounded,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Abdullah', // Replace with the actual name
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello!', // Larger text
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Abdullah', // Next line text
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Button 1
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFb7b6b6),
                    ),
                    child: const Text('Button 1'),
                  ),
                  const SizedBox(width: 30),
                  // Button 2 (Red color)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text('Button 2'),
                  ),
                  const SizedBox(width: 16),
                  // Button 3
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFb7b6b6),
                    ),
                    child: const Text('Button 3'),
                  ),
                  const SizedBox(width: 16),
                  // Button 4
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFb7b6b6),
                    ),
                    child: const Text('Button 4'),
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
