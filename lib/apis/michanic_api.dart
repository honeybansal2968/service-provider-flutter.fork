import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/mechanic_data_model.dart';

class MechanicAPI {
  static const String _baseUrl = 'https://your-api-endpoint.com'; // Replace with the actual API endpoint URL

  static Future<bool> submitMechanicData(MechanicDataModel mechanicData) async {
    print("n-------> ${mechanicData.page4Data.accountNumber}");
    final url = Uri.parse('$_baseUrl/submit_mechanic_data');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(mechanicData.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // If API call is successful
        return true;
      } else {
        // If API call fails
        return false;
      }
    } catch (e) {
      // Handle any exceptions or errors
      return false;
    }
  }
}
