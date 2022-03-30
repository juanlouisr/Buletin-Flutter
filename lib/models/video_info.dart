import 'package:buletin/constants.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class VideoInfo {
  final int videoId;
  final ChannelInfo channelInfo;
  final String title;
  final String desc;
  final String videoFileId;
  final DateTime datePosted;
  final int viewCount;
  final String thumbnail;
  final Map<String, String> interests;

  // Constructor
  VideoInfo({
    required this.videoId,
    required this.channelInfo,
    required this.title,
    required this.desc,
    required this.videoFileId,
    required this.datePosted,
    required this.viewCount,
    required this.thumbnail,
    required this.interests,
  });

  String getVideoId() {
    // return YoutubePlayer.convertUrlToId(videoUrl);
    // return videoFileId;
    return 'RKueSD3gLJQ';
  }

  String getVideoUrl() {
    return driveUrl + videoFileId;
  }

  String getThumbnail() {
    // return YoutubePlayer.getThumbnail(videoId: getVideoId());
    return driveUrl + thumbnail;
  }

  String getTimeago() {
    return timeago.format(datePosted);
  }

  String getVideoCount() {
    return NumberFormat().format(viewCount);
  }

  String getVideoCountCompact() {
    return NumberFormat.compact().format(viewCount);
  }

  factory VideoInfo.fromMap(Map<String, dynamic> map) {
    final int videoId = map['video_id'] as int;
    final int viewCount = map['video_view_count'] as int;
    final String title = map['video_title'] as String;
    final String desc = map['video_desc'] as String;
    final String thumbnail = map['video_thumbnail'] as String;
    final String videoFileId = map['video_file_id'] as String;
    final DateTime datePosted = DateTime.parse(map['date_posted']);
    final ChannelInfo channelInfo = ChannelInfo.fromMap(map['channel_info']);
    final Map<String, String> interest = Map.from(map['video_interest_info'])
        .map((k, v) => MapEntry<String, String>(k, v));

    return VideoInfo(
      videoId: videoId,
      channelInfo: channelInfo,
      title: title,
      desc: desc,
      videoFileId: videoFileId,
      datePosted: datePosted,
      viewCount: viewCount,
      thumbnail: thumbnail,
      interests: interest,
    );
  }
}
