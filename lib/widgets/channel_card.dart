import 'package:flutter/material.dart';
import 'package:buletin/widgets/aspect_ratio_image.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/screens/channel_screen.dart';

class ChannelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChannelScreen()));
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
            image: 'https://2.bp.blogspot.com/-02D2Du7X_D0/XL7ApmT9B2I/AAAAAAAAAQQ/1KNM-yNQMgsW_oBPVnYFTqF3y58RHg2pwCLcBGAs/s1600/csf.jpg',
            aspectRatio: cardAspectRatio
          ),
        )
      ),
    );
  }
}