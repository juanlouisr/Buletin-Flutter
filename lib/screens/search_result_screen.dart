import 'package:buletin/api/video_api.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  final String titleSearch;
  final TextEditingController textController;

  const SearchResultScreen({
    Key? key,
    required this.titleSearch,
    required this.textController,
  }): super(key: key);
  
  @override
  _SearchResultScreen createState() => _SearchResultScreen();
}

class _SearchResultScreen extends State<SearchResultScreen> {
  bool isCanScroll = true;
  int currentPage = 2;
  ValueNotifier<List<VideoInfo>> videoValueNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder<dynamic> (
        future: VideoAPI.getVideos(pageNo: 1, pageSize: 12, title: widget.titleSearch),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var resVideos = snapshot.data as List<VideoInfo>;
            if (currentPage == 2) {
              videoValueNotifier.value.addAll(resVideos);
            }

            return ValueListenableBuilder<List<VideoInfo>>(
              valueListenable: videoValueNotifier, 
              builder: (context, _content2, child) {
                return NotificationListener<ScrollEndNotification>(
                  child: SingleChildScrollView(
                    child: VideoListParted(
                      isShowButton: false,
                      title: 'Search Results',
                      videos: _content2,
                    ),
                  ),
                  onNotification: (notification) {
                    if (isCanScroll) {
                      VideoAPI.getVideos(pageNo: currentPage, pageSize: 12, title: widget.titleSearch).then((res) {
                        if (res.isNotEmpty) {
                          setState(() {
                            videoValueNotifier.value.addAll(res);
                            currentPage += 1;
                          });
                        } else {
                          isCanScroll = false;
                        }
                      });
                    }
                    return true;
                  },
                );
              }
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}