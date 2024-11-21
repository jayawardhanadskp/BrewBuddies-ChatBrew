import 'package:brewbuddies_chat/providers/chat_provider.dart';
import 'package:brewbuddies_chat/services/api_service.dart';
import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/widgets/coffee_small_widget.dart';
import 'package:brewbuddies_chat/widgets/home_widgets.dart';
import 'package:brewbuddies_chat/widgets/tab_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _chatController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatState(),
      child: Consumer<ChatState>(
        builder: (context, chatState, _) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Stack(
              children: [
                Column(children: [
                  const HomeWidgets(),
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: AppColors.normalBrown,
                    unselectedLabelColor: AppColors.lightGreay,
                    indicatorColor: AppColors.normalBrown,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    indicator: const BoxDecoration(
                        color: AppColors.normalBrown, shape: BoxShape.circle),
                    indicatorPadding: const EdgeInsets.only(top: 35),
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(text: 'Espresso'),
                      Tab(text: 'Latte'),
                      Tab(text: 'Cappuccino'),
                      Tab(text: 'Cafetière'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        TabContent(title: 'Espresso'),
                        TabContent(title: 'Latte'),
                        TabContent(title: 'Cappuccino'),
                        TabContent(title: 'Cafetière'),
                      ],
                    ),
                  ),
                  const HomeWidgetsDown(),
                ]),

                // ChatBot Toggle Button
                Positioned(
                  bottom: 130,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => chatState.toggleChatVisibility(),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: chatState.isChatVisible ? 50 : 70,
                      width: chatState.isChatVisible ? 50 : 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(114, 221, 168, 114),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/virtual-assistants.png',
                          height: chatState.isChatVisible ? 30 : 50,
                        ),
                      ),
                    ),
                  ),
                ),

                // Full Chat Interface
                AnimatedPositioned(
                  bottom: chatState.isChatVisible ? 90 : -800,
                  top: chatState.isChatVisible ? 170 : 300,
                  left: 50,
                  right: 50,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.slowMiddle,
                  child: AnimatedOpacity(
                    opacity: chatState.isChatVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: chatState.isChatVisible
                        ? Container(
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: AppColors.lightBrown.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.darkBrown),
                            ),
                            child: Column(
                              children: [
                                // Chat Header
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    color: AppColors.darkBrown.withOpacity(0.9),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "ChatBrew",
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
                                        onPressed: () =>
                                            chatState.toggleChatVisibility(),
                                      ),
                                    ],
                                  ),
                                ),

                                // Chat Messages List
                                Expanded(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: chatState.chatHistory.length,
                                    itemBuilder: (context, index) {
                                      var message =
                                          chatState.chatHistory[index];
                                      bool isBot = message['sender'] == 'bot';
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: _buildMessage(
                                            message['message']!,
                                            isBot: isBot),
                                      );
                                    },
                                  ),
                                ),

                                // Chat Input Field
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 50.0, left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _chatController,
                                          decoration: InputDecoration(
                                            hintText: "Type a message",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.send,
                                          color: AppColors.darkBrown,
                                          size: 29,
                                        ),
                                        onPressed: () async {
                                          if (_chatController.text.isNotEmpty) {
                                            String userMessage =
                                                _chatController.text;
                                            chatState.addMessage(
                                                'user', userMessage);
                                            _chatController.clear();

                                            // Get response from the Flask API
                                            String botResponse =
                                                await ApiService.chatResponse(
                                                    userMessage);
                                            chatState.addMessage(
                                                'bot', botResponse);
                                          }

                                          // Scroll to the bottom of the ListView after adding the message
                                          _scrollToBottom();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          );
        },
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
            color: isBot ? Colors.grey[200] : AppColors.darkBrown,
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
