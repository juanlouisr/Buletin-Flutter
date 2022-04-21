import 'package:flutter/material.dart';
import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/channel_info.dart';

class ChannelInformation extends StatefulWidget {
  final channelInfo;
  final width;
  final fontSizeTitle;
  final fontSizeSubtitle;
  const ChannelInformation({
    Key? key, 
    @required this.channelInfo,
    @required this.width,
    @required this.fontSizeTitle,
    @required this.fontSizeSubtitle,
  }): super(key: key);
  
  @override
  _ChannelInformation createState() => _ChannelInformation();
}

class _ChannelInformation extends State<ChannelInformation> {
  late ChannelInfo channelInfo;
  late int width;
  late int fontSizeTitle;
  late int fontSizeSubtitle;

  void initState() {
    super.initState();
    this.channelInfo = widget.channelInfo;
    this.fontSizeTitle = widget.fontSizeTitle;
    this.fontSizeSubtitle = widget.fontSizeSubtitle;
    this.width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Container(
          width: width.toDouble(),
          height: width.toDouble(),
          child: CircleAvatar(
            backgroundImage: NetworkImage(channelInfo.getThumbnail()),
            radius: 100,
          )
        ),

        SizedBox(height: 5),
        Text(
          channelInfo.channelName,
          style: poppins.copyWith(
            fontSize: fontSizeTitle.toDouble(),
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          '100 Videos',
          style: poppins.copyWith(
            fontSize: fontSizeSubtitle.toDouble(),
          )
        ),
        SizedBox(height: 20),
      ],
    );
  }
}