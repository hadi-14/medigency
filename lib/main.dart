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
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.red,
            elevation: 0.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color(0xFF808080), // Gray color in hex
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo Placeholder
                    Container(
                      width: 50, // Set your desired width
                      height: 50, // Set your desired height
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/your_logo.png'), // Replace with your logo
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Profile Icon and Name
                    Row(
                      children: [
                        CircleAvatar(
                          // Profile Icon
                          backgroundImage: AssetImage('assets/profile_icon.png'), // Replace with your profile icon
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
              Text(
                'Hello!', // Larger text
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Abdullah', // Next line text
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Button 1
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 1'),
                  ),
                  SizedBox(width: 16),
                  // Button 2 (Red color)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Button 2'),
                  ),
                  SizedBox(width: 16),
                  // Button 3
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 3'),
                  ),
                  SizedBox(width: 16),
                  // Button 4
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 4'),
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
