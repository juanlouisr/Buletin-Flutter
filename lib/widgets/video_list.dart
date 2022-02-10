import 'package:buletin/constants.dart';
import 'package:buletin/dummy_data.dart';
import 'package:buletin/widgets/video_card.dart';
import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(marginSize),
      child: GridView.count(
        // Nanti harusnya dynamic sesuai screen size
        crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 2 : 1,
        childAspectRatio:
            MediaQuery.of(context).size.width >= 600 ? 1.62 : 1.65,
        children: vidList
            .map((e) => VideoCard(
                  videoInfo: e,
                ))
            .toList(),
      ),
    );
  }
}
