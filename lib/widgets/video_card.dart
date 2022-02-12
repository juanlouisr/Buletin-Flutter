import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final VideoInfo videoInfo;
  const VideoCard({
    required this.videoInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        // margin: const EdgeInsets.all(marginSize),
        elevation: cardElevation,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: cardAspectRatio,
              child: Image.network(
                // sementara pakai url video
                videoInfo.videoUrl
                        .replaceAll("https://www.youtube.com/watch?v=",
                            "https://img.youtube.com/vi/")
                        .replaceAll("&t=15s", "") +
                    "/0.jpg",
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
      onTap: () {},
    );
  }
}
