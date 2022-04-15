import 'package:buletin/utils/constants.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:buletin/widgets/other/title_home.dart';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/widgets/other/appbar.dart';

class ForYouScreen extends StatelessWidget {
  final int pageSize = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: VideoAPI.getVideoByInterests(1, pageSize),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              var data = snapshot.data as List<VideoInfo>;
              return ScrollForYouRow(videos: data, pageSize: pageSize);
            }
          }
          return CircularProgressIndicator();
        },
      ),
      drawer: const SideNavigationBar(),
    );
  }
}

class ScrollForYouRow extends StatefulWidget {
  final videos;
  final pageSize;
  const ScrollForYouRow({Key? key, @required this.videos, @required this.pageSize}): super(key: key);

  @override
  _ScrollForYouRow createState() => _ScrollForYouRow();
}

class _ScrollForYouRow extends State<ScrollForYouRow> {
  List<VideoInfo> videos = [];
  int currentPage = 2;
  bool isCanScroll = true;

  void initState() {
    super.initState();
    videos = widget.videos;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleHome('For You'),
            ResponsiveGridRow(
              children: videos.map((video) {
                return ResponsiveGridCol(
                  xs: 12,
                  md: 6,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: VideoCard(videoInfo: video),
                  )
                );
              }).toList()
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