import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/mechanic_data_model.dart';

class MechanicAPI {
  static const String _baseUrl = 'https://service-provider-apis.onrender.com/api/v1'; // Replace with the actual API endpoint URL

  static Future<Map<String, dynamic>> submitMechanicData(Mechanic mechanicData) async {
    final url = Uri.parse('$_baseUrl/mechanic/signup');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(mechanicData.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print("Mechanic signed up successfully");
        print(response.body);
        return {'success': true, 'data': responseData};
      } else {
        // If API call fails, handle the error
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['message'] ?? 'Unknown error occurred';
        print('API Error: ${response.statusCode}');
        print('Error Message: $errorMessage');
        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      // Error - handle other exceptions here if needed
      final errorMessage = 'Failed to send data to the server';
      print('Exception: $e');
      return {'success': false, 'message': errorMessage};
    }
  }
}
