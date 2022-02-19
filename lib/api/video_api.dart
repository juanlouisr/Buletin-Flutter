import 'dart:convert';
import 'package:buletin/models/video_info.dart';
import 'package:http/http.dart' as http;
import 'package:buletin/constants.dart';

class VideoAPI {
  static Future<List<VideoInfo>> getVideoData() async {
    final queryParams = {
      'page_no': '1',
      'page_size': '1000',
    };
    var uri = Uri.http(baseUrl,videoListEndpoint,queryParams);
    var response =
        await http.get(uri);
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);

    List<VideoInfo> videoList = [];

    for (var u in jsonData['data']['videos']) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }

    return videoList;
  }
}