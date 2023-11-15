import 'package:flutter/material.dart';
import 'chat.dart';
import 'home.dart';
import 'help.dart';
import 'map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define initial route if necessary
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/chat': (context) => const ChatPage(),
        '/help': (context) => const HelpPage(),
        '/map': (context) => const MapPage(),
      },
    );
  }
}
