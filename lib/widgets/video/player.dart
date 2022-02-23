import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:buletin/models/video_info.dart';

class Player extends StatelessWidget {
  late VideoInfo video;

  Player(VideoInfo video) {
    this.video = video;
  }

  late YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId:video.getVideoId() ?? '',
      flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      )
      // child: Image.network(
      //   video.getThumbnail() ?? '',
      //   fit: BoxFit.cover,
      //   loadingBuilder: (BuildContext context, Widget child,
      //       ImageChunkEvent? loadingProgress) {
      //     if (loadingProgress == null) {
      //       return child;
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(
      //         value: loadingProgress.expectedTotalBytes != null
      //             ? loadingProgress.cumulativeBytesLoaded /
      //                 loadingProgress.expectedTotalBytes!
      //             : null,
      //       ),
      //     );
      //   },
      // )
    );
  }

}