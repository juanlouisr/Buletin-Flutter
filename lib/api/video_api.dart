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