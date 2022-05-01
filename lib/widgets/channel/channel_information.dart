import 'package:flutter/material.dart';
import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:buletin/utils/extension_image.dart';

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

  @override
  void initState() {
    super.initState();
    channelInfo = widget.channelInfo;
    fontSizeTitle = widget.fontSizeTitle;
    fontSizeSubtitle = widget.fontSizeSubtitle;
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: width.toDouble(),
          height: width.toDouble(),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                channelInfo.getThumbnail(),
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

        const SizedBox(height: 5),
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
        const SizedBox(height: 20),
      ],
    );
  }
}