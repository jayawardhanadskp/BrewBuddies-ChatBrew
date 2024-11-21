# BrewBuddies with ChatBew Chatbot

This is a Flutter app that allows users to interact with a coffee shop chatbot [**ChatBew**](https://github.com/jayawardhanadskp/ChatBrew.git). The chatbot is integrated with a Flask backend (using a pre-trained model) to provide responses. The app features a tab-based UI for different coffee options and a floating chatbot interface for assistance.

## Features

- **Tab-based coffee selection**: Users can browse through different coffee options such as Espresso, Latte, Cappuccino, and Cafetière.
- **Floating Chatbot**: A floating button allows users to interact with the chatbot for help.
- **Real-time Chat**: Chat messages are sent to the Flask backend for processing and responses. Previous messages are displayed when the chatbot is open, and the chat history is cleared when the chat is closed.
  
## App Architecture

- **Provider**: State management is handled using the `Provider` package, ensuring smooth interaction between the UI and business logic.
- **Dio**: API requests are made using the `Dio` package, which communicates with the Flask backend for chatbot responses.
- **Flask Backend**: The Flask server processes user messages and returns a response based on pre-trained intents.

---

## Project Setup

### Prerequisites

Make sure you have the following tools installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Dio](https://pub.dev/packages/dio)
- [Provider](https://pub.dev/packages/provider)

Additionally, you need to have the Flask backend running. You can find the Flask backend setup [here](https://github.com/jayawardhanadskp/ChatBrew.git).

---

