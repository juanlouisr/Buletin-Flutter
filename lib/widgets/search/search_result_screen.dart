import 'package:buletin/api/video_api.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/other/title_home.dart';
import 'package:buletin/widgets/search/searchbar.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  final String titleSearch;
  final TextEditingController textController;
  const SearchResultScreen({
    required this.textController,
    required this.titleSearch,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 100, right: 100, bottom: 20),
              child: RoundedSearchInput(
                textController: textController,
                hintText: "Cari video",
              ),
            ),
            VideoListParted(
              future: VideoAPI.getVideos(pageNo: 1, pageSize: 800, title: titleSearch),
              title: "Search Results",
            )
          ],
        ),
      ),
    );
  }
}
