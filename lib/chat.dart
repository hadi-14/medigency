import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: ChatPage(),
  ));
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
                    color: Color(0xFFb7b6b6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(); // Navigate to the main page
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
                              userName,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 112, 112, 112),
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
            body: Container(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: const ChatBot(),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _addMessage(String text, bool isUser) {
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: isUser));
    });

    if (isUser) {
      // Check for fixed pregnancy-related questions and provide fixed answers
      switch (text.toLowerCase()) {
        case 'what should I eat during pregnancy?':
          _addMessage(
              'It is essential to have a balanced diet including fruits, vegetables, whole grains, and lean proteins. Consult your doctor for personalized advice.',
              false);
          break;
        case 'how much weight should I gain during pregnancy?':
          _addMessage(
              'The recommended weight gain during pregnancy varies. Your doctor can provide guidance based on your individual circumstances.',
              false);
          break;
        case 'what exercises are safe during pregnancy?':
          _addMessage(
              'Low-impact exercises like walking, swimming, and prenatal yoga are generally safe. However, consult your doctor before starting any new exercise routine.',
              false);
          break;
        case 'how can I deal with morning sickness?':
          _addMessage(
              'Try eating small, frequent meals and staying hydrated. Ginger and peppermint may also help. Consult your doctor for specific advice.',
              false);
          break;
        case 'what should I avoid during pregnancy?':
          _addMessage(
              'Avoid alcohol, smoking, and certain medications. Limit caffeine intake and be cautious with certain foods like raw seafood and unpasteurized dairy.',
              false);
          break;
        default:
          // If the question is not fixed, provide a generic response
          _addMessage(
              'It is essential to have a balanced diet including fruits, vegetables, whole grains, and lean proteins. Consult your doctor for personalized advice.',
              false);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: _messages.map((message) {
                  return message.isUser
                      ? UserMessage(message.text)
                      : BotMessage(message.text);
                }).toList(),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 216, 216, 216), // Light gray color
            borderRadius:
                BorderRadius.circular(30.0), // Optional: Add rounded corners
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  onSubmitted: (text) {
                    _addMessage(text, true);
                    _controller
                        .clear(); // Clear the text field after sending the message
                  },
                  decoration: const InputDecoration(
                    hintText: 'Ask your problem....',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.red,
                ),
                onPressed: () {
                  final textToSend = _controller.text.trim();
                  if (textToSend.isNotEmpty) {
                    _addMessage(textToSend, true);
                    _controller
                        .clear(); // Clear the text field after sending the message
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class UserMessage extends StatelessWidget {
  final String text;

  UserMessage(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 221, 221),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}

class BotMessage extends StatelessWidget {
  final String text;

  BotMessage(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 221, 221),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
