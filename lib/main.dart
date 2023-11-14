import 'package:flutter/material.dart';
import 'chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75.0),
              child: AppBar(
                backgroundColor: Colors.red,
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 68.0,
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
                        const Column(
                          children: [
                            SizedBox(height: 2),
                            Icon(
                              Icons.person_rounded,
                              size: 35,
                              color: Colors.black,
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Abdullah', // Replace with the actual name
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(
                      16.0, 16.0, 16.0, 0.0), // Adjust the padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!', // Larger text
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '   Abdullah', // Next line text
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(
                        16.0), // Adjust the padding as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Button 1
                        ElevatedButton(
                          onPressed: () {
                            // Handle the onPressed for Button 1
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFb7b6b6),
                            foregroundColor:
                                const Color.fromARGB(255, 112, 112, 112),
                            minimumSize: const Size(double.infinity,
                                120), // Adjust the height as needed
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    32), // Adjust the horizontal padding as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the border radius
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_pin, size: 80),
                              SizedBox(width: 8),
                              Text(
                                ' F i n d  a\nHOSPITAL',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Button 2 (Red color)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(double.infinity,
                                130), // Adjust the height as needed
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    32), // Adjust the horizontal padding as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the border radius
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'HELP!',
                                style: TextStyle(fontSize: 38),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Button 3
                        ElevatedButton(
                          onPressed: () {
                            // Handle the onPressed for Button 3
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFb7b6b6),
                            foregroundColor:
                                const Color.fromARGB(255, 112, 112, 112),
                            minimumSize: const Size(double.infinity,
                                120), // Adjust the height as needed
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    32), // Adjust the horizontal padding as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the border radius
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pregnant_woman, size: 80),
                              SizedBox(width: 8),
                              Text(
                                'Maternity\nH  E  L  P',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Button 4
                        ElevatedButton(
                          onPressed: () {
                            // Handle the onPressed for Button 4
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFb7b6b6),
                            foregroundColor:
                                const Color.fromARGB(255, 112, 112, 112),
                            minimumSize: const Size(double.infinity,
                                120), // Adjust the height as needed
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    32), // Adjust the horizontal padding as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the border radius
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, size: 80),
                              SizedBox(width: 8),
                              Text(
                                'C a l l  a\nDOCTOR',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                // textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
