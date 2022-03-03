import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:buletin/constants.dart';
import 'package:buletin/helpers/storage.dart';
import 'package:buletin/models/account.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'dart:convert';

class AuthApi extends ChangeNotifier {
  bool _isAuth = false;

  get isAuth => _isAuth;

  Account? _account = null; 
  get account => _account;

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> authUser(LoginData data) async {
    var url = Uri.http(baseUrl,loginEndpoint);
    var body = jsonEncode({ 'email': data.name, 'password': data.password });
    var response = await http.post(url, body: body);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return jsonData['error'];
    }
    
    var token = jsonData['data']['token'];
    Map<String, dynamic> payload = Jwt.parseJwt(token);

    if (payload['account_id'] == 0) {
      return 'login failed';
    }

    await Storage.saveToken(jsonData['data']['token']);

    _isAuth = true;
    notifyListeners();

    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future checkUser() async {
    String? token = await Storage.readToken();

    if (token == null) {
      _isAuth = false;
      notifyListeners();
      return;
    }

    var url = Uri.http(baseUrl,profileEndpoint);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    var jsonData = jsonDecode(response.body);
    var profile = jsonData['data'];
    _account = Account.fromMap(profile);
    _isAuth = true;
    notifyListeners();
    return;
  }

  Future authLogout() async {
    await Storage.removeToken();
    _account = null;
    _isAuth = false;
    notifyListeners();
  }

  Future<bool> signupUser(SignupData data, String interestString) async {
    var url = Uri.http(baseUrl,registerEndpoint);
    var body = jsonEncode({ 
      'email': data.name,
      'password': data.password, 
      'fullname': data.additionalSignupData?['name'],
      'phone_number': data.additionalSignupData?['phone'],
      'interest_id': interestString,
      'role': 'user',
    });
    var response = await http.post(url, body: body);
    if (response.statusCode != 200) {
      return false;
    }

    var jsonData = jsonDecode(response.body);
    var token = jsonData['data']['token'];
    await Storage.saveToken(token);
    _isAuth = true;
    notifyListeners();

    return true;
  }

  Future<String?> recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      //   return 'User not exists';
      // }
      return null;
    });
  }
}