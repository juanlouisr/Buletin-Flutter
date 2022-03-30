import 'dart:convert';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/models/playlist_info.dart';
import 'package:http/http.dart' as http;

class PlaylistAPI {
  static Future<List<PlaylistInfo>> getPlayList(int categoryId) async {
    final queryParams = {
      'category_id': categoryId.toString(),
    };
    var uri = Uri.http(baseUrl, playlistEndpoint, queryParams);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<PlaylistInfo> playlist = [];

    for (var pl in jsonData['data']['playlists']) {
      final playlistId = pl['playlist_id'] as int;
      final playlistName = pl['playlist_name'] as String;
      final playlistPicture = pictureParser(pl['playlist_picture']);
      final videoList = await VideoAPI.getVideos(
        pageNo: 1,
        pageSize: 1000,
        playlistId: playlistId,
      );
      playlist.add(PlaylistInfo(
        id: playlistId,
        name: playlistName,
        picture: playlistPicture,
        videos: videoList,
      ));
    }

    return playlist;
  }
}
