import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/video_info.dart';

class PlaylistInfo {
  final int id;
  final String name;
  final String picture;
  final List<VideoInfo> videos;

  String getPictureUrl() => driveUrl + picture;

  PlaylistInfo({
    required this.id,
    required this.name,
    required this.picture,
    required this.videos,
  });
}
