import 'package:buletin/constants.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:buletin/widgets/channel/channel_list.dart';
import 'package:buletin/widgets/other/title_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavigationBar(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Text(
              appName,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          TitleHome('New Release'),
          VideoList(),
          TitleHome('Channel'),
          ChannelList(),
        ],
      ),
    );
  }
}
