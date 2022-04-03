import 'dart:convert';

import 'package:http/http.dart' as http;

class MyPage {
  String baseUrl = "http://labancaria2.obliviondev.com.ar/wp-json/wp/v2/pages";
  Future<List> getAllPage() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (SocketException) {
      return Future.error("Error Fetching Data");
    }
  }
}
