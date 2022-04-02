import 'package:buletin/constants.dart';
import 'package:buletin/models/playlist_info.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlaylistDetail extends StatelessWidget {
  final PlaylistInfo playlistInfo;
  const PlaylistDetail({
    required this.playlistInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                playlistInfo.getPictureUrl(),
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 5,),
                            Text(
                              "Videos",
                              style: poppins.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Urutkan",
                              style: poppins.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: const Icon(Icons.sort_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    // Untuk sekarang dibuat not scrollable
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 235,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: playlistInfo.videos.length,
                    itemBuilder: (context, i) {
                      var video = playlistInfo.videos[i];
                      return VideoCardNew(videoInfo: video);
                    },
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
