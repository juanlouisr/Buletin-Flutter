import 'package:flutter/material.dart';
import 'package:buletin/widgets/video/video_player.dart';
import 'package:buletin/widgets/video/video_card_show.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/models/video_info.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Show extends StatelessWidget {
  late List<VideoInfo> videos;
  late VideoInfo video;
  final int pageSize = 8;

  Show(VideoInfo video) {
    this.video = video;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideNavigationBar(),
        appBar: CustomAppBar(),
        body: Container(
          child: FutureBuilder<dynamic> (
            future: VideoAPI.getVideoByInterests(1, pageSize),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var videos = snapshot.data as List<VideoInfo>;
                return ScrollShowRow(video: video, videos: videos, pageSize: pageSize);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }

              return CircularProgressIndicator();
            },
          )
        ), 
      );
  }
}

class ScrollShowRow extends StatefulWidget {
  final video;
  final videos;
  final pageSize;
  const ScrollShowRow({Key? key, @required this.videos, @required this.video, @required this.pageSize}): super(key: key);

  @override
  _ScrollShowRow createState() => _ScrollShowRow();
}

class _ScrollShowRow extends State<ScrollShowRow> {
  late VideoInfo video;
  List<VideoInfo> videos = [];
  int currentPage = 2;
  bool isCanScroll = true;

  void initState() {
    super.initState();
    videos = widget.videos;
    video = widget.video;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      child: SingleChildScrollView(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              lg: 8,
              sm: 12,
              child: VideoPlayer(videoInfo: video)
            ),
            ResponsiveGridCol(
              lg: 4,
              sm: 12,
              child: Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: ListView.builder(
                  itemCount: videos.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, int index) {
                    return VideoCardShow(videos[index] as VideoInfo);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      onNotification: (notification) {
        if (isCanScroll) {
          VideoAPI.getVideoByInterests(currentPage, widget.pageSize).then((res) {
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