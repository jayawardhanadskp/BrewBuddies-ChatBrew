import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/widgets/coffee_small_widget.dart';
import 'package:brewbuddies_chat/widgets/home_widgets.dart';
import 'package:brewbuddies_chat/widgets/tab_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // chat bot visibility animation
  bool _isChatBotVisible = false;

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

  void _toggleChatBotVisibility() {
    setState(() {
      _isChatBotVisible = !_isChatBotVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
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
            ],
          ),
          Positioned(
            bottom: 130,
            right: 10,
            child: GestureDetector(
              onTap: _toggleChatBotVisibility,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isChatBotVisible ? 50 : 70,
                  width: _isChatBotVisible ? 50 : 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(114, 221, 168, 114),
                  ),
                  child: Center(
                      child: Image.asset(
                    'assets/virtual-assistants.png',
                    height: _isChatBotVisible ? 30 : 50,
                  ))
                  // Icon(
                  //   Icons.chat_bubble_outline,
                  //   size: _isChatBotVisible ? 20 : 40,
                  //   color: Colors.white,
                  // ),
                  ),
            ),
          ),

          // Full chat interface
          AnimatedPositioned(
            bottom: _isChatBotVisible ? 90 : -800,
            top: _isChatBotVisible ? 170 : 300,
            left: 50,
            right: 50,
            duration: const Duration(milliseconds: 700),
            curve: Curves.slowMiddle,
            child: AnimatedOpacity(
              opacity: _isChatBotVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: _isChatBotVisible
                  ? Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: AppColors.lightBrown.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.darkBrown)),
                      child: Column(
                        children: [
                          // Chat Header
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: AppColors.darkBrown.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onPressed: _toggleChatBotVisibility,
                                ),
                              ],
                            ),
                          ),

                          // Chat messages list
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(10),
                              children: [
                                _buildMessage(
                                    "Hello! How can I help you today?",
                                    isBot: true),
                                _buildMessage(
                                    "I need help with ordering a coffee.",
                                    isBot: false),
                                _buildMessage("Sure, I can assist with that!",
                                    isBot: true),
                              ],
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
                                        filled: true),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.darkBrown,
                                    size: 29,
                                  ),
                                  onPressed: () {
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
