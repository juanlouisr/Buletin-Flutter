import 'package:buletin/models/channel_info.dart';

class VideoInfo {
  final String videoId;
  final ChannelInfo channelInfo;
  final String title;
  final String desc;
  final String videoUrl;
  final DateTime datePosted;
  int viewCount;
  String thumbnail;

  // Constructor
  VideoInfo({
    required this.videoId,
    required this.channelInfo,
    required this.title,
    required this.desc,
    required this.videoUrl,
    required this.datePosted,
    required this.viewCount,
    required this.thumbnail,
  });

  factory VideoInfo.fromMap(Map<String, dynamic> map) {
    final String videoId = map['video_id'] as String;
    final ChannelInfo channelInfo = ChannelInfo.fromMap(map['channel_info']);
    final String title = map['video_title'] as String;
    final String desc = map['video_desc'] as String;
    final String videoUrl = map['video_url'] as String;
    final DateTime datePosted = DateTime.parse(map['date_posted']);
    int viewCount = map['video_view_count'] as int;
    String thumbnail = map['video_thumbnail'] as String;
    
    return VideoInfo(
      videoId: videoId,
      channelInfo: channelInfo,
      title: title,
      desc: desc,
      videoUrl: videoUrl,
      datePosted: datePosted,
      viewCount: viewCount,
      thumbnail: thumbnail,
    );
  }
}