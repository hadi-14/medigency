import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat.dart';
import 'home.dart';
import 'help.dart';
import 'map.dart';
import 'call.dart';
import 'form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _checkLocalDataExists(),
        builder: (context, snapshot) {
          return MaterialApp(
            initialRoute:
                snapshot.hasData && snapshot.data == true ? '/' : '/form',
            routes: {
              '/': (context) => HomeScreen(),
              '/chat': (context) => const ChatPage(),
              '/help': (context) => const HelpPage(),
              '/map': (context) => MapPage(),
              '/call': (context) => const CallPage(),
              '/form': (context) => const FormPage(),
            },
          );
        });
  }

  Future<bool> _checkLocalDataExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.containsKey('name'));
    return prefs.containsKey('name');
  }
}
