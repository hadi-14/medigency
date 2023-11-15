import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Colors.red,
          elevation: 0.0,
          flexibleSpace: Container(
            height: 68.0,
            decoration: const BoxDecoration(
              color: Color(0xFFb7b6b6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo_text.png'),
                      ),
                    ),
                  ),
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
                        'Abdullah',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Your Help Content Goes Here
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Your Help Content Here',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // Loader Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.withOpacity(0.5),
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'Bringing Your Help...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpPage(),
  ));
}
