import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/screens/show.dart';
import 'package:buletin/constants.dart';

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
              width: 140,
              height: 80,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    // 'https://img.youtube.com/vi/o1cLDdNiHLI/0.jpg'
                    videoInfo.getThumbnail() ?? '#'
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
                    style: poppins.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        '${videoInfo.getVideoCountCompact()} views',
                        style: poppins.copyWith(
                          fontSize: 10,
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5, left: 5), 
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                        ),
                      ),
                      Text(
                        videoInfo.getTimeago(),
                        style: poppins.copyWith(
                          fontSize: 10,
                        )
                      )
                    ],
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