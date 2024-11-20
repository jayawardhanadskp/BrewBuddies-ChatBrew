import 'package:flutter/material.dart';
import 'dart:async';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // State to control chatbox visibility and animation
  bool _isChatVisible = false;

  // Controller for chat input
  TextEditingController _chatController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _chatController.dispose();
    super.dispose();
  }

  // This is the function to toggle chat visibility and animate it smoothly
  void _toggleChatBox() {
    setState(() {
      _isChatVisible = !_isChatVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          // Main Content of the Home Page
          Column(
            children: [
              // Your other widgets (tabs, headers, etc.)
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Your Home Page Content Here'),
              ),
            ],
          ),

          // Animated Chat Button (Floating Button)
          Positioned(
            bottom: 50,
            right: 0,
            child: GestureDetector(
              onTap: _toggleChatBox,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _isChatVisible ? 0 : 70,  // Button shrinks when chat is visible
                width: _isChatVisible ? 0 : 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
                child: Icon(
                  Icons.chat_bubble_outline,
                  size: _isChatVisible ? 0 : 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Full Chat Interface
          AnimatedPositioned(
            bottom: _isChatVisible ? 0 : -800, // Animate the chat interface up and down
            top: 50,
            left: 0,
            right: 0,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: _isChatVisible
                ? Container(
                    height: MediaQuery.of(context).size.height / 0.5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Chat Header
                        Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.blueAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Chatbot",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onPressed: _toggleChatBox,
                              ),
                            ],
                          ),
                        ),

                        // Chat messages list
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: [
                              _buildMessage("Hello! How can I help you today?", isBot: true),
                              _buildMessage("I need help with ordering a coffee.", isBot: false),
                              _buildMessage("Sure, I can assist with that!", isBot: true),
                            ],
                          ),
                        ),

                        // Chat Input Field
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0, left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _chatController,
                                  decoration: InputDecoration(
                                    hintText: "Type a message",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  // Add logic for sending the message (later connect with chatbot)
                                  setState(() {
                                    // Add the message to the chat (just a dummy message for now)
                                  });
                                  _chatController.clear();
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  // Helper function to build messages in the chat interface
  Widget _buildMessage(String text, {bool isBot = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isBot ? Colors.grey[200] : Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isBot ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
