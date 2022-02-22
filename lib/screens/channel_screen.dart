import 'package:buletin/constants.dart';
import 'package:buletin/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video_card.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<VideoInfo> vidList = [
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
      VideoInfo(videoId: 6, channelInfo: ChannelInfo(ownerId: 1, channelId: 1, channelName: 'asd', channelPicture: 'placeholder', createdAt: DateTime.parse('2022-01-12T12:38:39.583772+07:00')), title: 'Jatuh Bangun Founder Tiket.com', desc: 'Punya karier bagus di luar negeri dengan penghasilan yang besar, sudah diberi status penduduk tetap di Kanada, namun lebih memilih pulang kampung dan merintis usaha dari nol? Itulah kisah Gaery Undarsa, Co-Founder sekaligus Chief Marketing Officer Tiket.com', videoUrl: 'https://www.youtube.com/watch?v=NWfmX6zqJgE', datePosted: DateTime.parse('2022-01-12T12:38:39.583772+07:00'), viewCount: 119, thumbnail: 'placeholder'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Text(
              appName,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ResponsiveGridRow(
            children: vidList.map((video) {
              return ResponsiveGridCol(
                xs: 12,
                md: 6,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: VideoCard(videoInfo: video),
                )
              );
            }).toList()
        ),
      ),
      drawer: const SideNavigationBar(),
    );
  }
}