import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat.dart';
import 'help.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userName = ''; // Variable to hold the user's name

  @override
  void initState() {
    super.initState();
    loadUserName(); // Load the username when the widget initializes
  }

  Future<void> loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('name'));
    setState(() {
      // Retrieve the username from local storage
      userName = prefs.getString('name') ??
          ''; // Default to empty string if no username is found
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ensure the username is loaded before building the UI
    if (userName.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Or any loading indicator
        ),
      );
    }

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
                        Column(
                          children: [
                            const SizedBox(height: 2),
                            const Icon(
                              Icons.person_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              userName, // Replace with the actual name
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  fontSize: 10),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      16.0, 16.0, 16.0, 0.0), // Adjust the padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello!', // Larger text
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "    $userName", // Next line text
                        style: const TextStyle(fontSize: 35),
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
                        // Button 1 with a crown/star icon
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/map');
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
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 5,
                              right: 5,
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Button 2 (Red color)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/help');
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
                            Navigator.pushNamed(context, '/chat');
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
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Button 4 with a crown/star icon
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/call');
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
                                      fontSize: 30,
                                    ),
                                    // textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 5,
                              right: 5,
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                          ],
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
