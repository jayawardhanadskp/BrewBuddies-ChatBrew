import 'package:dio/dio.dart';

class ApiService {
  static const url = 'http://127.0.0.1:5000/chat';

  static Future<String> chatResponse(String message) async {
    Dio dio = Dio();

    try {
      // Send POST request to Flask API with message in JSON format
      final response = await dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {'message': message}, // Send the message as data
      );

      // check
      if (response.statusCode == 200) {
        print(response.data);

        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
