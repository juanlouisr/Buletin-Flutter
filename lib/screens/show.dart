import 'package:flutter/material.dart';
import 'package:buletin/widgets/video/video_player.dart';
import 'package:buletin/widgets/video/video_card_show.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/models/video_info.dart';

class Show extends StatelessWidget {
  late List<VideoInfo> videos;
  late int videoId;

  Show(int videoId) {
    this.videoId = videoId;
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final column1 = widthScreen / 10 * 6.5;
    final column2 = widthScreen - column1;
    return Scaffold(
        drawer: const SideNavigationBar(),
        appBar: AppBar(
          title: Text('Buletin')
        ),
        body: Container(
          child: FutureBuilder<dynamic> (
            future: VideoAPI.getDetailVideo(videoId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var vid = snapshot.data[0];
                var videos = snapshot.data[1];
                return SingleChildScrollView(
                  child: Wrap(
                    children: [
                      VideoPlayer(videoInfo: vid as VideoInfo),
                      Container(
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        width: column2,
                        child: ListView.builder(
                          itemCount: videos.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, int index) {
                            return VideoCardShow(videos[index]);
                          },
                        ),
                      )
                    ],
                  ),
                );
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