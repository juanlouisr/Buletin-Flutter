import 'package:flutter/material.dart';
import 'package:buletin/templates/screen_template.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:buletin/api/video_api.dart';
import 'package:provider/provider.dart';
import 'package:buletin/api/auth_api.dart';
import 'package:buletin/models/video_info.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}): super(key: key);
  
  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  List<VideoInfo> videos = [];
  bool isCanScroll = true;
  int pageSize = 2;
  ValueNotifier<List<VideoInfo>> videoValueNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    String? identifier = context.read<AuthApi>().viewerId ?? '';

    return ScreenTemplate(
      useSidebar: true,
      child: FutureBuilder<dynamic> (
        future: VideoAPI.getHistoryVideo(pageNo: 1, pageSize: 12, viewerId: identifier!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var resVideos = snapshot.data as List<VideoInfo>;
            if (pageSize == 2) {
              videoValueNotifier.value.addAll(resVideos);
            }

            return ValueListenableBuilder<List<VideoInfo>>(
              valueListenable: videoValueNotifier, 
              builder: (context, _content2, child) {
                return NotificationListener<ScrollEndNotification>(
                  child: SingleChildScrollView(
                    child: VideoListParted(
                      isShowButton: false,
                      title: 'History',
                      videos: _content2,
                    ),
                  ),
                  onNotification: (notification) {
                    if (isCanScroll) {
                      VideoAPI.getHistoryVideo(pageNo: pageSize, pageSize: 12, viewerId: identifier).then((res) {
                        var data = res as List<VideoInfo>;
                        if (data.length > 0) {
                          setState(() {
                            videoValueNotifier.value.addAll(data);
                            pageSize += 1;
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

          return CircularProgressIndicator();
        },
      ),
    );
  }
}