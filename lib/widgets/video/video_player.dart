import 'package:flutter/material.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/channel/channel.dart';
import 'package:buletin/widgets/video/player.dart';
import 'package:buletin/constants.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:timeago/timeago.dart' as timeago;

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
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Player(videoInfo: videoInfo),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
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
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(148, 148, 148, 100),
                width: 2
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  md: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://2.bp.blogspot.com/-02D2Du7X_D0/XL7ApmT9B2I/AAAAAAAAAQQ/1KNM-yNQMgsW_oBPVnYFTqF3y58RHg2pwCLcBGAs/s1600/csf.jpg'),
                      radius: 100,
                    )
                  ),
                ),
                ResponsiveGridCol(
                  md: 10,
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(
                          lg: 12,
                          child: SizedBox(
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
                          child: SizedBox(
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
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'Deskripsi',
              style: poppins.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              videoInfo.desc,
              style: poppins.copyWith(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0),
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
                  margin: EdgeInsets.only(right: 10),
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