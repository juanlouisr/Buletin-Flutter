import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatelessWidget {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // child: YoutubePlayer(
      //   controller: _controller,
      //   showVideoProgressIndicator: true,
      // )
      child: Image.network(
        'https://2.bp.blogspot.com/-02D2Du7X_D0/XL7ApmT9B2I/AAAAAAAAAQQ/1KNM-yNQMgsW_oBPVnYFTqF3y58RHg2pwCLcBGAs/s1600/csf.jpg',
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
      )
    );
  }

}