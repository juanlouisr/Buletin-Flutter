import 'package:buletin/api/video_api.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:flutter/material.dart';

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
      child: FutureBuilder<List<VideoInfo>>(
        future: VideoAPI.getVideos(
          pageNo: 1,
          pageSize: 8,
        ),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('Loading'),
            );
          } else {
            return SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (snapshot.data ?? []).length,
                  itemBuilder: (context, i) {
                    return Container(
                      height: 200,
                      width: 400,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: GridTile(
                          child: VideoCard(
                        videoInfo: (snapshot.data as List<VideoInfo>)[i],
                      )),
                    );
                  },
                ));
          }
        },
      ),
    );
  }
}
