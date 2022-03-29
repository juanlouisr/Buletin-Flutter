import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/screens/channel_screen.dart';
import 'package:buletin/widgets/other/aspect_ratio_image.dart';
import 'package:flutter/material.dart';
import 'package:buletin/screens/show.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Show(videoInfo)));
        },
        child: Column(
          children: <Widget>[
            AspectRatioImageNetwork(
                image: videoInfo.getThumbnail()!, aspectRatio: cardAspectRatio),
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

class VideoCardShareable extends StatelessWidget {
  final VideoInfo videoInfo;

  const VideoCardShareable({
    Key? key,
    required this.videoInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Show(videoInfo)));
              },
              child: AspectRatioImageNetwork(
                  image: videoInfo.getThumbnail()!,
                  aspectRatio: cardAspectRatio),
            ),
            // Positioned(
            //     child: Container(
            //   child: Text("video duration"),
            // ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChannelScreen(videoInfo.channelInfo)));
                },
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    videoInfo.channelInfo.channelPicture,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Show(videoInfo)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          videoInfo.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 15.0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${videoInfo.channelInfo.channelName} • ${videoInfo.viewCount} views • ${timeago.format(videoInfo.datePosted)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  share(context);
                },
                child: const Icon(
                  Icons.more_vert,
                  size: 20.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void share(BuildContext context) {
    RenderBox? box = context.findRenderObject() as RenderBox;
    final String message =
        "I found this inspiring videos at Buletin.id. Check this out! ${videoInfo.getVideoUrl()}";

    Share.share(
      message,
      subject: 'Description',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
