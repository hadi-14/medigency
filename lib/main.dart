import 'package:flutter/material.dart';
import 'chat.dart';
import 'home.dart';
import 'help.dart';
import 'map.dart';
import 'call.dart';
import 'form.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLocalDataExists(), // Check if local data exists
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loader while checking local data
        } else {
          if (snapshot.hasData && snapshot.data == true) {
            return MaterialApp(
              // Define initial route if data exists
              initialRoute: '/',
              routes: {
                '/': (context) => const HomeScreen(),
                '/chat': (context) => const ChatPage(),
                '/help': (context) => const HelpPage(),
                '/map': (context) => MapPage(),
                '/call': (context) => const CallPage(),
              },
            );
          } else {
            return MaterialApp(
              // Define initial route if data doesn't exist
              home: FirstTimeForm(), // Show the form page
            );
          }
        }
      },
    );
  }

  Future<bool> _checkLocalDataExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Check if any key exists (assuming 'name' is one of the keys used in the form)
    return prefs.containsKey('name');
  }
}

// Create a FirstTimeForm widget for capturing initial user data
class FirstTimeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          FormPage(), // Replace YourFormWidget with the widget that contains the initial form
    );
  }
}
