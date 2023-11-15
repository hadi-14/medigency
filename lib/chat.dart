import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ChatPage());
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
            body: const ChatBot(),
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
  final String openAIKey =
      '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'; // Replace with your OpenAI API Key

  void _addMessage(String text, bool isUser) async {
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: isUser));
    });

    if (isUser) {
      try {
        final response = await http.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            'Authorization': 'Bearer $openAIKey',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "You are a Skilled doctor with speciality in maternity help"
              },
              {
                "role": "user",
                "content":text
              }
            ]
          }),
        );

        print(response.body);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final botResponse = data['choices'][0]['text'].toString().trim();
          _addMessage(botResponse, false);
        } else {
          throw Exception('Failed to fetch response');
        }
      } catch (e) {
        print('Error: $e');
        _addMessage('Sorry, I encountered an issue. Please try again.', false);
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
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return message.isUser
                    ? UserMessage(message.text)
                    : BotMessage(message.text);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (text) {
              _addMessage(text, true);
            },
            decoration: InputDecoration(
              hintText: 'Type a message...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // TODO: Handle sending the message
                },
              ),
            ),
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
          color: const Color(0xFFb7b6b6),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
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
          color: const Color(0xFFb7b6b6),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
        ),
      ),
    );
  }
}
