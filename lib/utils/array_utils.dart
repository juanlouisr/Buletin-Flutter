import 'package:buletin/models/video_info.dart';

class ArrayUtils {
  static void sortVideoListByViewCount(List<VideoInfo> videoList) {
    videoList.sort(((a, b) => b.viewCount.compareTo(a.viewCount)));
  }

  static void sortVideoListByViewCountAsc(List<VideoInfo> videoList) {
    videoList.sort(((a, b) => a.viewCount.compareTo(b.viewCount)));
  }

  static void sortVideoListByDate(List<VideoInfo> videoList) {
    videoList.sort(((a, b) => b.datePosted.compareTo(a.datePosted)));
  }

  static void sortVideoListByDateAsc(List<VideoInfo> videoList) {
    videoList.sort(((a, b) => a.datePosted.compareTo(b.datePosted)));
  }

  static void sortVideoByChannelId(List<VideoInfo> videoList) {
    videoList.sort(
        ((a, b) => b.channelInfo.channelId.compareTo(a.channelInfo.channelId)));
  }

  static void sortVideoByChannelIdAsc(List<VideoInfo> videoList) {
    videoList.sort(
        ((a, b) => a.channelInfo.channelId.compareTo(b.channelInfo.channelId)));
  }

  static List<VideoInfo> filterVideoByInterestIds(
    List<VideoInfo> videoList,
    List<String> interestIds,
  ) {
    return videoList.where((element) {
      for (var videoKeys in element.interests.keys) {
        if (!interestIds.contains(videoKeys)) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  static List<VideoInfo> filterVideoByInterestString(
    List<VideoInfo> videoList,
    List<String> interests,
  ) {
    return videoList.where((element) {
      for (var videoKeys in element.interests.keys) {
        if (!interests.contains(element.interests[videoKeys])) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  static List<VideoInfo> filterVideoByDate(
    List<VideoInfo> videoList,
    DateTime startDate, {
    DateTime? endDate,
  }) {
    return videoList.where((element) {
      return element.datePosted.isAfter(startDate) &&
          element.datePosted.isBefore(endDate ?? DateTime.now());
    }).toList();
  }
}
