import 'package:buletin/constants.dart';
import 'package:buletin/models/playlist_info.dart';
import 'package:buletin/widgets/other/aspect_ratio_image.dart';
import 'package:buletin/widgets/playlist/playlist_detail.dart';
import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final PlaylistInfo playlistInfo;

  const PlaylistCard({
    required this.playlistInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardBorderRadius),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlaylistDetail(playlistInfo: playlistInfo)));
            },
            child: Stack(
              children: [
                AspectRatioImageNetwork(
                  image: playlistInfo.thumbnail,
                  aspectRatio: 2.2,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    // height: 100,
                    padding: const EdgeInsets.all(8.0),
                    width: 60,
                    color: const Color.fromRGBO(0, 0, 0, 0.6),
                    child: Center(
                      child: Text(
                        // playlistInfo.videoList.length.toString(),
                        playlistInfo.videos.length.toString() + ' videos',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            playlistInfo.playlistName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
