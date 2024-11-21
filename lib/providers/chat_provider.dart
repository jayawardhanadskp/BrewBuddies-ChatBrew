import 'package:flutter/material.dart';

class ChatState with ChangeNotifier {
  final List<Map<String, String>> _chatHistory = [];
  bool _isChatVisible = false;

  List<Map<String, String>> get chatHistory => _chatHistory;
  bool get isChatVisible => _isChatVisible;

  void toggleChatVisibility() {
    _isChatVisible = !_isChatVisible;
    if (!_isChatVisible) {
      clearChat();
    }
    notifyListeners();
  }

  void addMessage(String sender, String message) {
    _chatHistory.add({'sender': sender, 'message': message});
    notifyListeners();
  }

  void clearChat() {
    _chatHistory.clear();
    notifyListeners();
  }
}
