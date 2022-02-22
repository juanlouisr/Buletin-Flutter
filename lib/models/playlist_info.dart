import 'package:buletin/models/video_info.dart';

class PlaylistInfo {
  final int playlistId;
  final String playlistName;
  final String thumbnail;
  final List<VideoInfo> videos;

  PlaylistInfo({
    required this.playlistId,
    required this.playlistName,
    required this.thumbnail,
    required this.videos,
  });

  // factory PlaylistInfo.fromMaps(Map<String, dynamic> map, ) {
  //   return PlaylistInfo(
  //     playlistId: playlistId,
  //     name: name,
  //     thumbnail: thumbnail,
  //     videos: videos,
  //   );
  // }
}
