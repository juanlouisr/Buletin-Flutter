import 'package:buletin/api/auth_api.dart';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/utils/constants.dart';
import 'package:buletin/helpers/identifier.dart';
import 'package:buletin/models/account.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/screens/channel_screen.dart';
import 'package:buletin/widgets/other/aspect_ratio_image.dart';
import 'package:flutter/material.dart';
import 'package:buletin/screens/show.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:responsive_grid/responsive_grid.dart';

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
                image: videoInfo.getThumbnail(), aspectRatio: cardAspectRatio),
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
                  image: videoInfo.getThumbnail(),
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
                              ChannelScreen(channelInfo: videoInfo.channelInfo)));
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

class VideoCardNew extends StatelessWidget {
  final VideoInfo videoInfo;
  final Color? titleColor;

  const VideoCardNew({
    Key? key,
    required this.videoInfo,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? identifier = context.read<AuthApi>().viewerId;

    return GestureDetector(
      onTap: () {
        VideoAPI.createVideoView(videoInfo.videoId, identifier!);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Show(videoInfo)));
      },
      child: SizedBox(
        width: 235,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.network(
                videoInfo.getThumbnail(),
                width: 235,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    width: 235,
                    height: 150,
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.1),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    md: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(videoInfo.channelInfo.channelPicture),
                        radius: 100,
                      )
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          videoInfo.title,
                          overflow: TextOverflow.ellipsis,
                          style: poppins.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: titleColor ?? colorBlack,
                          ),
                        ),
                        Text(
                          '${videoInfo.channelInfo.channelName}  ●  ${videoInfo.getVideoCount()} views  ●  ${videoInfo.getTimeago()}',
                          style: poppins.copyWith(
                            fontSize: 14.0,
                            color: colorGrey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
