import 'package:buletin/api/video_api.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<VideoInfo> vidList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4 * marginSize),
      child: FutureBuilder<List<VideoInfo>> (
        future: VideoAPI.getVideoData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('Loading'),
            );
          } else {
            return GridView.builder(
              itemCount: (snapshot.data)!.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                crossAxisSpacing: marginSize,
                mainAxisSpacing: marginSize,
                childAspectRatio: 1.59,
              ),
              itemBuilder: (context, i) {
                return GridTile(
                    child: VideoCard(
                  videoInfo: (snapshot.data as List<VideoInfo>)[i],
                ));
              },
            );
          }
        },
      ),
    );
  }
}
