import 'package:buletin/api/playlist_api.dart';
import 'package:buletin/models/playlist_info.dart';
import 'package:buletin/widgets/playlist_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PlaylistList extends StatelessWidget {
  final int categoryId;

  const PlaylistList({
    required this.categoryId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FutureBuilder<List<PlaylistInfo>>(
        future: PlaylistAPI.getPlayList(categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var playlistinfos = snapshot.data as List<PlaylistInfo>;
            return ResponsiveGridList(
                desiredItemWidth: 300,
                minSpacing: 10,
                children: playlistinfos
                    .map((e) => PlaylistCard(playlistInfo: e))
                    .toList());
          } else {
            return const Center(
              child: Text("Category tidak mempunyai playlist"),
            );
          }
        },
      ),
    );
  }
}
