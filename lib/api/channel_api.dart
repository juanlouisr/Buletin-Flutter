import 'dart:convert';

import 'package:buletin/constants.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:http/http.dart' as http;

class ChannelAPI {
  static Future<List<ChannelInfo>> get() async {
    final queryParams = {
      'page_no': '1',
      'page_size': '8',
    };
    var uri = Uri.http(baseUrl, channelListEndpoint, queryParams);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<ChannelInfo> channels = [];

    for (var pl in jsonData['data']['channels']) {
      var channel = ChannelInfo.fromMap(pl);
      channels.add(channel);
    }

    return channels;
  }
}
