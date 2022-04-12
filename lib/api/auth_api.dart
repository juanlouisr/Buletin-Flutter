import 'package:buletin/api/interest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:buletin/constants.dart';
import 'package:buletin/helpers/storage.dart';
import 'package:buletin/models/account.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';
import 'package:buletin/helpers/identifier.dart';

class AuthApi extends ChangeNotifier {
  bool _isAuth = false;

  get isAuth => _isAuth;

  Account? _account;
  get account => _account;

  String? _viewerId = '';
  get viewerId => _viewerId;

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> authUser(LoginData data) async {
    var url = Uri.http(baseUrl, loginEndpoint);
    var body = jsonEncode({'email': data.name, 'password': data.password});
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
      _viewerId = await Identifier.getDeviceId() ?? '';
      notifyListeners();
      return;
    }

    var interestIds = JwtDecoder.decode(token)["interest_id"];

    List<String> interests = await InterestAPI.getInterest(ids: interestIds);

    var url = Uri.http(baseUrl, profileEndpoint);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    var jsonData = jsonDecode(response.body);
    var profile = jsonData['data'];
    _account = Account.fromMap(profile, interests);
    _isAuth = true;
    _viewerId = _account?.accountId.toString();
    notifyListeners();
    return;
  }

  Future authLogout() async {
    await Storage.removeToken();
    _account = null;
    _isAuth = false;
    _viewerId = await Identifier.getDeviceId() ?? '';
    notifyListeners();
  }

  Future<bool> signupUser(SignupData data, String interestString) async {
    var url = Uri.http(baseUrl, registerEndpoint);
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

  static Future<bool> changePassword({
    required String email,
    required String oldPass,
    required String newPass,
  }) async {
    var url = Uri.http(baseUrl, changePasswordEndpoint);
    var body = jsonEncode({
      'email': email,
      'old_password': oldPass,
      'new_password': newPass,
    });
    var response = await http.put(url, body: body);
    if (response.statusCode != 200) return false;
    var jsonData = jsonDecode(response.body);
    if (jsonData["error"] != null) return false;
    return true;
  }

  Future<String?> recoverPassword(String name) async {
    var url = Uri.http(baseUrl, forgotPasswordEndpoint);
    var body = jsonEncode({
      'email': name,
    });
    await http.post(url, body: body);
    return null;
  }
}