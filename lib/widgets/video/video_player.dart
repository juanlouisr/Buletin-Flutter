import 'package:flutter/material.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video/player.dart';
import 'package:buletin/utils/constants.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:buletin/screens/channel_screen.dart';
import 'package:buletin/utils/extension_image.dart';

class VideoPlayer extends StatelessWidget {
  final VideoInfo videoInfo;
  const VideoPlayer({
    required this.videoInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final column1 = widthScreen / 10 * 6.5;
    final interests = videoInfo.interests;
    return Container(
      width: column1,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Player(videoInfo: videoInfo),
          Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Text(
              videoInfo.title,
              textAlign: TextAlign.left,
              style: poppins.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelScreen(channelInfo: videoInfo.channelInfo)));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(148, 148, 148, 100),
                  width: 2
                ),
                borderRadius: BorderRadius.circular(15)
              ),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    md: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 75,
                      height: 75,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            videoInfo.channelInfo.getThumbnail(),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, exeption, stackTrace) {
                              return Image.asset(
                                'placeholder'.jpg,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 10,
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            lg: 12,
                            child: const SizedBox(
                              height: 15,
                            )
                          ),

                          ResponsiveGridCol(
                            lg: 6,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                videoInfo.channelInfo.channelName,
                                style: poppins.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ),
                          ResponsiveGridCol(
                            lg: 6,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${videoInfo.getVideoCount()} views',
                                style: poppins.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ),

                          ResponsiveGridCol(
                            lg: 12,
                            child: const SizedBox(
                              height: 3,
                            )
                          ),

                          ResponsiveGridCol(
                            lg: 6,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '100 videos',
                                style: poppins.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ),
                          ResponsiveGridCol(
                            lg: 6,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                videoInfo.getTimeago(),
                                style: poppins.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          
          Container(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Deskripsi',
              style: poppins.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              videoInfo.desc,
              style: poppins.copyWith(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Tags',
              style: poppins.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
            child: Row(
              children: List.from(interests.values.map((interest) => 
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
                    label: Text(
                      interest,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                    backgroundColor: colorPrimary,
                  )
                )
              )),
            ),
          )
        ],
      ),
    );
  }

}