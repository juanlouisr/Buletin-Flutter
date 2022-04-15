import 'dart:convert';

import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:http/http.dart' as http;

class ChannelAPI {
  static Future<List<ChannelInfo>> get({
    required int pageNo,
    required int pageSize,
    int? ownerId,
  }) async {
    final queryParams = {
      'page_no': pageNo.toString(),
      'page_size': pageSize.toString(),
      'owner_id': ownerId.toString(),
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
