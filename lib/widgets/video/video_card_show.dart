import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/screens/show.dart';

class VideoCardShow extends StatelessWidget {
  late VideoInfo videoInfo;

  VideoCardShow(VideoInfo videoInfo) {
    this.videoInfo = videoInfo;
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Show(videoInfo)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 20),
        child: Row(
          children: [
            Container(
              width: 160,
              height: 90,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    // 'https://img.youtube.com/vi/o1cLDdNiHLI/0.jpg'
                    videoInfo.getThumbnail()
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    videoInfo.channelInfo.channelName,
                    style: TextStyle(
                      color: Colors.grey[800]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}