import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buletin/constants.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class InterestAPI {
  static Future<List<C2Choice<dynamic>>> get() async {
    var uri = Uri.http(baseUrl,interestEndpoint);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    var data = jsonData['data']['interests'] ?? [];

    List<C2Choice<dynamic>> interests = [];
    for (final id in data.keys) {
      final value = data[id];
      interests.add(C2Choice<dynamic>(value: id, label: value));
    }

    return interests;
  }
}