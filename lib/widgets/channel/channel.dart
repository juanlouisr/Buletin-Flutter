import 'package:flutter/material.dart';
import 'package:buletin/models/channel_info.dart';

class Channel extends StatelessWidget {
  late ChannelInfo channel;

  Channel(ChannelInfo channel) {
    this.channel = channel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://2.bp.blogspot.com/-02D2Du7X_D0/XL7ApmT9B2I/AAAAAAAAAQQ/1KNM-yNQMgsW_oBPVnYFTqF3y58RHg2pwCLcBGAs/s1600/csf.jpg'),
              radius: 100,
            )
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channel.channelName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '1683 Video',
                  style: TextStyle(
                    color: Colors.grey[700]
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}