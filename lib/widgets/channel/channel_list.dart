import 'package:flutter/material.dart';
import 'package:buletin/constants.dart';
import 'package:buletin/widgets/channel/channel_card.dart';

class ChannelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4 * marginSize),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450,
            childAspectRatio: 3 / 5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
          scrollDirection: Axis.horizontal,
          children: [
            ChannelCard(),
            ChannelCard(),
            ChannelCard(),
            ChannelCard(),
            ChannelCard(),
            ChannelCard(),
            ChannelCard(),
            ChannelCard(),
          ],
        ),
      ),
    );
  }
}