import 'dart:convert';
import 'package:buletin/models/channel_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class VideoInfo {
  final int videoId;
  final ChannelInfo channelInfo;
  final String title;
  final String desc;
  final DateTime datePosted;
  final List<String>? interests; 
  int viewCount;
  String thumbnail;

  // Constructor
  VideoInfo({
    required this.videoId,
    required this.channelInfo,
    required this.title,
    required this.desc,
    required this.datePosted,
    required this.viewCount,
    required this.thumbnail,
    this.interests,
  });

  String? getVideoId() {
    return 'RKueSD3gLJQ';
  }

  String? getThumbnail() {
    return YoutubePlayer.getThumbnail(videoId: getVideoId()!);
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
    final ChannelInfo channelInfo = ChannelInfo.fromMap(map['channel_info']);
    final String title = map['video_title'] as String;
    final String desc = map['video_desc'] as String;
    final DateTime datePosted = DateTime.parse(map['date_posted']);
    int viewCount = map['video_view_count'] as int;
    String thumbnail = map['video_thumbnail'] as String;

    var data = map['video_interest_info'] ?? [];
    List<String> interests = [];
    for (final id in data.keys) {
      final value = data[id];
      interests.add(value);
    }

    return VideoInfo(
      videoId: videoId,
      channelInfo: channelInfo,
      title: title,
      desc: desc,
      datePosted: datePosted,
      viewCount: viewCount,
      thumbnail: thumbnail,
      interests: interests,
    );
  }
}
