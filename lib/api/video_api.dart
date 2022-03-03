import 'dart:convert';
import 'package:buletin/models/video_info.dart';
import 'package:http/http.dart' as http;
import 'package:buletin/constants.dart';

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

  static Future<List<dynamic>> getDetailVideo(int videoId) async {
    var uri = Uri.http(baseUrl,'video/' + videoId.toString());
    final queryParams = {
      'page_no': '1',
      'page_size': '1000',
    };
    var uri2 = Uri.http(baseUrl,videoListEndpoint,queryParams);
    final results = await Future.wait([
      http.get(uri),
      http.get(uri2)
    ]);

    var vidRes = jsonDecode(results[0].body);
    var vid = VideoInfo.fromMap(vidRes['data']);

    var jsonData = jsonDecode(results[1].body);
    List<VideoInfo> videoList = [];

    for (var u in jsonData['data']['videos']) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }

    return [vid, videoList];
  }
}