import 'package:buletin/constants.dart';
import 'package:buletin/models/playlist_info.dart';
import 'package:buletin/widgets/playlist/playlist_card.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PlaylistDetail extends StatelessWidget {
  final PlaylistInfo playlistInfo;
  const PlaylistDetail({
    required this.playlistInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 200,
            child: Image.network(
              playlistInfo.thumbnail,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 60,
              left: 60,
              bottom: 30,
            ),
            child: ResponsiveGridRow(
              children: [
                ...playlistInfo.videos.map((video) {
                  return ResponsiveGridCol(
                      xs: 12,
                      md: 6,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: VideoCard(videoInfo: video),
                      ));
                }).toList(),
                ...playlistInfo.videos.map((video) {
                  return ResponsiveGridCol(
                      xs: 12,
                      md: 6,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: VideoCard(videoInfo: video),
                      ));
                }).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
