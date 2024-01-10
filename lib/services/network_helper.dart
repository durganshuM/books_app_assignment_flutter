import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.baseURL});
  final String baseURL;

  Future<dynamic> postData({required String notaryId}) async {
    final url = Uri.parse(baseURL);
    try {
      http.Response response =
          await http.post(url, body: {"notaryId": notaryId});

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
