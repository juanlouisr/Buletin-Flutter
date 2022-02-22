import 'package:buletin/constants.dart';
import 'package:buletin/widgets/playlist_list.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  final int categoryId;
  const CategoryDetail({
    required this.categoryId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Text(
              appName,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PlaylistList(
          categoryId: categoryId,
        ),
      ),
    );
  }
}
