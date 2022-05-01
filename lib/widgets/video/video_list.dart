import 'package:buletin/api/video_api.dart';
import 'package:buletin/utils/array_utils.dart';
import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/screens/show.dart';
import 'package:buletin/widgets/other/popup_menu.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:buletin/utils/extension_image.dart';

class VideoListHorizontal extends StatelessWidget {
  final Future<List<VideoInfo>> future;
  final Color? textColor;
  const VideoListHorizontal({
    Key? key,
    required this.future,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: FutureBuilder<List<VideoInfo>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('Loading'),
            );
          } else {
            return SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (snapshot.data ?? []).length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: GridTile(
                          child: VideoCardNew(
                        videoInfo: (snapshot.data as List<VideoInfo>)[i],
                        titleColor: textColor,
                      )),
                    );
                  },
                ));
          }
        },
      ),
    );
  }
}

class NewVideoComponent extends StatelessWidget {
  const NewVideoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = Scaffold.of(context).appBarMaxHeight!;
    double contentHeight = deviceSize.height - appBarHeight - statusBarHeight;
    return FutureBuilder<List<VideoInfo>>(
      future: VideoAPI.getVideos(
        pageNo: 1,
        pageSize: 1,
        orderBy: "date_posted",
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final VideoInfo videoInfo = snapshot.data![0];
          return SizedBox(
            width: double.infinity,
            height: contentHeight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Show(videoInfo)));
              },
              child: Stack(
                children: [
                  Image.network(
                    // videoInfo.getThumbnail(),
                    videoInfo.getThumbnail(),
                    // "https://htmlcolorcodes.com/assets/images/colors/white-color-solid-background-1920x1080.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    errorBuilder: (context, exeption, stackTrace) {
                      print(exeption);
                      return Image.asset(
                        'placeholder'.jpg,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      );
                    },
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
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: contentHeight,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: const [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              videoInfo.title,
                              style: poppins.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: colorWhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              videoInfo.getTimeago(),
                              overflow: TextOverflow.ellipsis,
                              style: poppins.copyWith(
                                fontSize: 20.0,
                                color: colorGrey,
                              ),
                            ),
                          ],
                        ),
                        VideoListHorizontal(
                          future: VideoAPI.getVideos(
                              pageNo: 1, pageSize: 8, orderBy: "date_posted"),
                          textColor: colorWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("No Video"),
          );
        }
      },
    );
  }
}

class VideoListParted extends StatefulWidget {
  final List<VideoInfo> videos;
  final bool isShowButton;
  final String title;
  final Widget? leading;
  final Widget? button;

  const VideoListParted({
    Key? key,
    required this.videos,
    required this.title,
    required this.isShowButton,
    this.leading,
    this.button,
  }) : super(key: key);

  @override
  State<VideoListParted> createState() => _VideoListPartedState();
}

class _VideoListPartedState extends State<VideoListParted> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    widget.leading ?? Container(),
                    Text(
                      widget.title,
                      style: poppins.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(width: 10),
                CustomPopUpMenu(
                  menuList: [
                    PopupMenuItem(
                      child: CustomPopUpMenu(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("View Count"),
                            Icon(Icons.chevron_right_rounded),
                          ],
                        ),
                        menuList: [
                          PopupMenuItem(
                            child: const Text("Asc"),
                            onTap: () {
                              setState(() {
                                ArrayUtils.sortVideoListByViewCountAsc(
                                    widget.videos);
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: const Text("Desc"),
                            onTap: () {
                              setState(() {
                                ArrayUtils.sortVideoListByViewCount(
                                    widget.videos);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: CustomPopUpMenu(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Date Posted"),
                            Icon(Icons.chevron_right_rounded),
                          ],
                        ),
                        menuList: [
                          PopupMenuItem(
                            child: const Text("Asc"),
                            onTap: () {
                              setState(() {
                                ArrayUtils.sortVideoListByDateAsc(
                                    widget.videos);
                              });
                            },
                          ),
                          PopupMenuItem(
                            child: const Text("Desc"),
                            onTap: () {
                              setState(() {
                                ArrayUtils.sortVideoListByDate(widget.videos);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                  child: Row(
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ResponsiveGridRow(
            children: widget.videos.map((video) {
              return ResponsiveGridCol(
                lg: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: VideoCardNew(videoInfo: video),
                ),
              );
            }).toList(),
          ),
          if (widget.isShowButton) ...[widget.button ?? Container()]
        ],
      ),
    );
  }
}
