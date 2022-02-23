import 'package:flutter/material.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/channel/channel.dart';
import 'package:buletin/widgets/video/player.dart';

class VideoPlayer extends StatelessWidget {
  final VideoInfo videoInfo;
  const VideoPlayer({
    required this.videoInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final column1 = widthScreen / 10 * 6.5;
    return Container(
      width: column1,
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Player(videoInfo),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text(
              videoInfo.channelInfo.channelName,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Text(
              videoInfo.title,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Divider(),
          Channel(videoInfo.channelInfo),
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              videoInfo.desc,
              style: TextStyle(
                fontSize: 16
              )
            ),
          )
        ],
      ),
    );
  }

}