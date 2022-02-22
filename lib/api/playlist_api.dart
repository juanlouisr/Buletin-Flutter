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
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);

    List<PlaylistInfo> playlist = [];

    for (var pl in jsonData['data']['playlists']) {
      var playlistId = pl['playlist_id'] as int;
      var playlistName = pl['playlist_name'] as String;
      var videoList = await VideoAPI.getPlaylistVideos(playlistId);
      playlist.add(PlaylistInfo(
        playlistId: playlistId,
        playlistName: playlistName,
        thumbnail: "https://akcdn.detik.net.id/community/media/visual/2018/10/20/cd7922fb-43a9-4e5f-bb86-af2b820d43d4_169.png?w=700&q=90",
        videos: videoList,
      ));
    }

    return playlist;
  }
}
