import 'dart:convert';
import 'package:buletin/constants.dart';
import 'package:buletin/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryAPI {
  static Future<List<Category>> getCategory() async {
    var uri = Uri.http(baseUrl, categoryEndpoint);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    List<Category> categories = [];
    for (var data in jsonData['data']) {
      categories.add(Category.fromMap(data));
    }
    return categories;
  }
}