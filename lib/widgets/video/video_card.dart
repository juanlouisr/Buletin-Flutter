import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/other/aspect_ratio_image.dart';
import 'package:flutter/material.dart';
import 'package:buletin/screens/show.dart';

class VideoCard extends StatelessWidget {
  final VideoInfo videoInfo;
  const VideoCard({
    required this.videoInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      elevation: cardElevation,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Show(videoInfo.videoId)));
        },
        child: Column(
          children: <Widget>[
            AspectRatioImageNetwork(
                image: videoInfo.videoUrl
                        .replaceAll("https://www.youtube.com/watch?v=",
                            "https://img.youtube.com/vi/")
                        .replaceAll("&t=15s", "") +
                    "/0.jpg",
                aspectRatio: cardAspectRatio),
            Padding(
              padding: const EdgeInsets.all(paddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo.title,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    videoInfo.desc,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
