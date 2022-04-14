import 'package:buletin/api/channel_api.dart';
import 'package:buletin/models/channel_info.dart';
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
        child: FutureBuilder(
          future: ChannelAPI.get(pageNo: 1, pageSize: 8),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 450,
                    childAspectRatio: 3 / 5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15
                  ),
                  scrollDirection: Axis.horizontal, 
                  itemCount: (snapshot.data as List<ChannelInfo>).length,
                  itemBuilder: (context, i) {
                    var channel = (snapshot.data as List<ChannelInfo>)[i];
                    return ChannelCard(channel);
                  }
                );
              }
              
            }
            return CircularProgressIndicator();
          },
        ),
        // child: GridView(
        //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 450,
        //     childAspectRatio: 3 / 5,
        //     crossAxisSpacing: 15,
        //     mainAxisSpacing: 15),
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     ChannelCard(),
        //     ChannelCard(),
        //     ChannelCard(),
        //     ChannelCard(),
        //     ChannelCard(),
        //     ChannelCard(),
        //     ChannelCard(),
        //     ChannelCard(),
        //   ],
        // ),
      ),
    );
  }
}