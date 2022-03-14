import 'dart:convert';
import 'package:buletin/models/video_info.dart';
import 'package:http/http.dart' as http;
import 'package:buletin/constants.dart';
import 'package:buletin/helpers/storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class VideoAPI {
  static Future<List<VideoInfo>> getVideoData(int pageNo, int pageSize) async {
    final queryParams = {
      'page_no': pageNo.toString(),
      'page_size': pageSize.toString(),
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

  static Future<List<VideoInfo>> getVideoDataSearch(String title) async {
    final queryParams = {
      'page_no': '1',
      'page_size': '1000',
      'title': title,
    };
    var uri = Uri.http(baseUrl,videoListEndpoint,queryParams);
    print(uri);
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

  static Future<List<VideoInfo>> getChannelVideos(int pageNo, int pageSize, int channelId) async {
    final queryParams = {
      'page_no': pageNo.toString(),
      'page_size': pageSize.toString(),
      'channel_id': channelId.toString(),
    };
    var uri = Uri.http(baseUrl,videoListEndpoint,queryParams);
    var response =
        await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<VideoInfo> videoList = [];

    var data = jsonData['data']['videos'] ?? [];
    for (var u in data) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }

    return videoList;
  }

  static Future<List<VideoInfo>> getPlaylistVideos(int playlistId) async {
    final queryParams = {
      'page_no': '1',
      'page_size': '1000',
      'playlist_id': playlistId.toString(),
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

  static Future<List<VideoInfo>> getVideoByInterests(int pageNo, int pageSize) async {
    String? token = await Storage.readToken();
    String interestIds = '';

    if (token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      interestIds = payload['interest_id'];
    }

    final queryParams = {
      'page_no': pageNo.toString(),
      'page_size': pageSize.toString(),
      'interest_id': interestIds,
    };
    var uri = Uri.http(baseUrl,videoListEndpoint,queryParams);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<VideoInfo> videoList = [];

    var data = jsonData['data']['videos'] ?? [];
    for (var u in data) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }

    return videoList;
  }
}