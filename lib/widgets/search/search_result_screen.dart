import 'package:buletin/api/video_api.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/other/title_home.dart';
import 'package:buletin/widgets/search/searchbar.dart';
import 'package:buletin/widgets/video/video_card.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 30,
          left: 60,
          right: 60,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
              child: RoundedSearchInput(
                textController: textController,
                hintText: "Cari video",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TitleHome("Search Result"),
            ),
            Expanded(
              child: FutureBuilder(
                future: VideoAPI.getVideos(
                  pageNo: 1,
                  pageSize: 1000,
                  title: titleSearch,
                ),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text("Tidak ada video"),
                    );
                  } else {
                    return GridView.builder(
                      // shrinkWrap: true,
                      itemCount: (snapshot.data as List<VideoInfo>).length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 500,
                        crossAxisSpacing: marginSize * 3,
                        mainAxisSpacing: marginSize * 3,
                        childAspectRatio: 1.59,
                      ),
                      itemBuilder: (context, i) {
                        return GridTile(
                            child: VideoCardShareable(
                          videoInfo: (snapshot.data as List<VideoInfo>)[i],
                        ));
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
