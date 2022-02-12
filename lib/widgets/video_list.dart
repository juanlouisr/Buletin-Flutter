import 'dart:convert';
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

  Future getVideoData() async {
    var response =
        await http.get(Uri.http(androidLocalhost, videoListEndpoint));
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);

    List<VideoInfo> videoList = [];

    for (var u in jsonData['data']['videos']) {
      var vid = VideoInfo.fromMap(u);
      videoList.add(vid);
    }

    return videoList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4 * marginSize),
      child: FutureBuilder(
        future: getVideoData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('Loading'),
            );
          } else {
            return GridView.builder(
              itemCount: (snapshot.data as List<VideoInfo>).length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                crossAxisSpacing: marginSize,
                mainAxisSpacing: marginSize,
                childAspectRatio: 1.62,
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
