import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:buletin/widgets/other/title_home.dart';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/widgets/other/appbar.dart';

class ChannelScreen extends StatelessWidget {
  late ChannelInfo channel;

  ChannelScreen(ChannelInfo channel) {
    this.channel = channel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: VideoAPI.getVideos(
          pageNo: 1,
          pageSize: 4,
          channelId: channel.channelId,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              var data = snapshot.data as List<VideoInfo>;
              return ScrollChannelRow(videos: data, channel: channel);
            }
          }
          return CircularProgressIndicator();
        },
      ),
      drawer: const SideNavigationBar(),
    );
  }
}

class ScrollChannelRow extends StatefulWidget {
  final channel;
  final videos;
  const ScrollChannelRow(
      {Key? key, @required this.videos, @required this.channel})
      : super(key: key);

  @override
  _ScrollChannelRow createState() => _ScrollChannelRow();
}

class _ScrollChannelRow extends State<ScrollChannelRow> {
  late ChannelInfo channel;
  List<VideoInfo> videos = [];
  int currentPage = 2;
  bool isCanScroll = true;

  void initState() {
    super.initState();
    videos = widget.videos;
    channel = widget.channel;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleHome('Video dari ${channel.channelName}'),
            ResponsiveGridRow(
                children: videos.map((video) {
              return ResponsiveGridCol(
                  xs: 12,
                  md: 6,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: VideoCard(videoInfo: video),
                  ));
            }).toList())
          ],
        ),
      ),
      onNotification: (notification) {
        if (isCanScroll) {
          VideoAPI.getVideos(
            pageNo: currentPage,
            pageSize: 4,
            channelId: channel.channelId,
          ).then((res) {
            var data = res as List<VideoInfo>;
            if (data.length > 0) {
              setState(() {
                videos.addAll(data);
              });
              currentPage += 1;
            } else {
              isCanScroll = false;
            }
          });
        }
        return true;
      },
    );
  }
}
