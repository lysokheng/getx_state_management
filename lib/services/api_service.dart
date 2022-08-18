import 'dart:convert';

import 'package:getx_state_management/models/new_res_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<NewsResModel?> getLastNews() async {
    var url = Uri.parse('https://newsdata.io/api/1/news?apikey=pub_102984588981412939a6ac99224c3a98d4cd8');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final map = jsonDecode(response.body);
      return NewsResModel.fromJson(map);
    } else {
      return null;
    }
  }
}
