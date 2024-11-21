import 'package:dio/dio.dart';

class ApiService {
  static const String url = 'http://127.0.0.1:5000/chat';

  // Function to send the message and get response from the Flask API
  static Future<String> chatResponse(String message) async {
    Dio dio = Dio();  // Create Dio instance

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {'message': message},  // Send the message as data
      );

      if (response.statusCode == 200) {
        return response.data['response'];  // Return the response from the bot
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
