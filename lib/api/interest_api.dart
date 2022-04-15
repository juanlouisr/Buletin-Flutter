import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buletin/utils/constants.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class InterestAPI {
  static Future<List<C2Choice<dynamic>>> get() async {
    var uri = Uri.http(baseUrl, interestEndpoint);
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

  static Future<List<String>> getInterest({String? ids}) async {
    Uri uri;
    if (ids != null) {
      uri = Uri.http(baseUrl, interestEndpoint, {"interest_id": ids});
    }
    else {
      uri = Uri.http(baseUrl, interestEndpoint);
    }
    
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    Map<String, dynamic> data = jsonData['data']['interests'] ?? {};

    return data.values.map((e) => e.toString()).toList();
  }
}
