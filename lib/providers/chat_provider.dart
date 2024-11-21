import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  final List<Map<String, String>> _chatHistory = [];
  bool _isChatVisible = false;

  List<Map<String, String>> get chatHistory => _chatHistory;
  bool get isChatVisible => _isChatVisible;

  // add messages to the chat history
  void addMessage(String sender, String message) {
    _chatHistory.add({'sender': sender, 'message': message});
    notifyListeners();
  }

  void toggleChatVisibility() {
    _isChatVisible = !_isChatVisible;
    if (!_isChatVisible) {
      _chatHistory.clear();  // Clear chat history when closed
    }
    notifyListeners();
  }
}
