import 'dart:convert';
import 'package:buletin/models/video_info.dart';
import 'package:http/http.dart' as http;
import 'package:buletin/utils/constants.dart';
import 'package:buletin/helpers/storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class VideoAPI {
  static Future<List<VideoInfo>> getVideos({
    required int pageNo,
    required int pageSize,
    String? title,
    int? channelId,
    int? playlistId,
    int? playlistIdExcept,
    int? categoryId,
    int? ownerId,
    int? interestId,
    String? orderBy,
    String? orderByType,
  }) async {
    final queryParams = {
      'page_no': pageNo.toString(),
      'page_size': pageSize.toString(),
      'channel_id': channelId?.toString(),
      'playlist_id': playlistId?.toString(),
      'playlist_id_except': playlistIdExcept?.toString(),
      'category_id': categoryId?.toString(),
      'owner_id': ownerId?.toString(),
      'interest_id': interestId?.toString(),
      'orderBy': orderBy?.toString(),
      'orderByType': orderByType?.toString(),
      'title': title?.toString(),
    };

    var uri = Uri.http(baseUrl, videoListEndpoint, queryParams);
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

  static Future<List<VideoInfo>> getVideoByInterests(
      int pageNo, int pageSize) async {
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
    var uri = Uri.http(baseUrl, videoListEndpoint, queryParams);
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

  static Future<List<VideoInfo>> getHotVideos({
    int? limit,
    int? nLastDay,
  }) async {
    final queryParams = {
      'limit': limit?.toString(),
      'n_last_day': nLastDay?.toString(),
    };

    var uri = Uri.http(baseUrl, hotEndpoint, queryParams);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<VideoInfo> videoList = [];
    for (var u in jsonData['data']['videos']) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }
    return videoList;
  }

  static Future<List<VideoInfo>> getHistoryVideo({
    required int pageNo,
    required int pageSize,
    required String viewerId,
  }) async {
    final queryParams = {
      'page_no': pageNo.toString(),
      'page_size': pageSize.toString(),
    };

    var uri = Uri.http(baseUrl, historyEndpoint + '/${viewerId}', queryParams);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<VideoInfo> videoList = [];
    var data = jsonData['data']['video_history'] ?? [];
    for (var u in data) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }
    return videoList;
  }

  static Future createVideoView(int videoId, String identifier) async {
    var url = Uri.http(baseUrl, videoViewEndpoint);
    var response = await http.post(url, body: jsonEncode({
      "video_id": videoId,
      "viewer_id": identifier.toString(),
    }));
  }
}
