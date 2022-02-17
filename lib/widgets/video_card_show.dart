import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:buletin/models/dummy_video.dart';

class VideoCardShow extends StatelessWidget {
  late DummyVideo test;

  VideoCardShow(DummyVideo test) {
    this.test = test;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
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
                    // 'https://2.bp.blogspot.com/-02D2Du7X_D0/XL7ApmT9B2I/AAAAAAAAAQQ/1KNM-yNQMgsW_oBPVnYFTqF3y58RHg2pwCLcBGAs/s1600/csf.jpg'
                    test.thumbnail
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    test.name,
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
                    test.channelName,
                    style: TextStyle(
                      color: Colors.grey[800]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}