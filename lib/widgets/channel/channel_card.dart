import 'package:flutter/material.dart';
import 'package:buletin/widgets/other/aspect_ratio_image.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/screens/channel_screen.dart';
import 'package:buletin/models/channel_info.dart';

class ChannelCard extends StatelessWidget {
  late ChannelInfo channel;

  ChannelCard(ChannelInfo channel) {
    this.channel = channel;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelScreen(channel)));
      },
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardBorderRadius),
          ),
          elevation: 5,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: AspectRatioImageNetwork(
            // image: 'https://2.bp.blogspot.com/-02D2Du7X_D0/XL7ApmT9B2I/AAAAAAAAAQQ/1KNM-yNQMgsW_oBPVnYFTqF3y58RHg2pwCLcBGAs/s1600/csf.jpg',
            // image: 'https://havecamerawilltravel.com/wp-content/uploads/2015/08/YouTube-Thumbnails-800x450.jpg',
            image: channel.channelPicture,
            aspectRatio: cardAspectRatio
          ),
        )
      ),
    );
  }
}