import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(); // Navigate to main page
                          },
                          child: Container(
                            width: 150, // Set your desired width
                            height: 50, // Set your desired height
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/logo_text.png'), // Replace with your logo
                              ),
                            ),
                          ),
                        ), // Profile Icon and Name
                        Column(
                          children: [
                            const SizedBox(height: 1),
                            const Icon(
                              Icons.person_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            const SizedBox(height: 1),
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
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the content vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 500.0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                // Loader Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  color: Colors
                      .transparent, // Set the background color to transparent
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120, // Set your desired width
                        height: 120, // Set your desired height
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(
                              60), // Set the border radius to make it rounded
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors
                                .white), // Set the progress bar color to white
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, size: 36, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Connecting to your Doctor...',
                              style: TextStyle(fontSize: 22, color: Colors.red),
                            ),
                          ]),
                    ],
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
