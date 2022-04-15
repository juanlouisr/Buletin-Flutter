import 'dart:ffi';

import 'package:buletin/api/video_api.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:flutter/material.dart';
import 'package:buletin/api/auth_api.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buletin/utils/extension_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<VideoInfo> hotVideos = [];
  bool isCanScroll = true;
  int pageSize = 2;
  ValueNotifier<List<VideoInfo>> hotVideoValueNotifier = ValueNotifier([]);
  ValueNotifier<bool> isCanScrollValueNotifier = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() {
    Provider.of<AuthApi>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavigationBar(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NewVideoComponent(),
            const SizedBox(height: 10,),
            FutureBuilder(
              future: VideoAPI.getHotVideos(limit: 8, nLastDay: 7),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return VideoListParted(
                    videos: snapshot.data as List<VideoInfo>,
                    isShowButton: false,
                    title: "Hot Videos",
                    leading: Padding(
                      padding: const EdgeInsets.all(8).copyWith(bottom: 9),
                      child: SvgPicture.asset(
                        'flame'.svg,
                        width: 20,
                        height: 20,
                      ),
                    )
                  );
                }
                return const Center(
                  child: Text("No Videos"),
                );
              }
            ),
            const SizedBox(height: 10,),
            FutureBuilder(
              future: VideoAPI.getVideoByInterests(1, 8),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  hotVideos = snapshot.data as List<VideoInfo>;
                  if (pageSize == 2) {
                    hotVideoValueNotifier.value.addAll(hotVideos);
                  }
                  return ValueListenableBuilder<List<VideoInfo>>(
                    valueListenable: hotVideoValueNotifier, 
                    builder: (_, _content, __) {
                      return ValueListenableBuilder<bool>(
                        valueListenable: isCanScrollValueNotifier, 
                        builder: (context, _content2, child) {
                          return VideoListParted(
                            isShowButton: _content2,
                            title: 'For You',
                            videos: _content,
                            button: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colorPrimary,
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                VideoAPI.getVideoByInterests(pageSize, 8).then((res) {
                                  var data = res as List<VideoInfo>;
                                  if (data.length > 0) {
                                    setState(() {
                                      pageSize += 1;
                                    });
                                    hotVideoValueNotifier.value.addAll(data);
                                  } else {
                                    setState(() {
                                      isCanScrollValueNotifier.value = false;
                                    });
                                  }
                                });
                              },
                              child: const Text(
                                'More',
                              ),
                            ),
                          );
                        }
                      );
                    }
                  );
                }
                return const Center(
                  child: Text("No Videos"),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
