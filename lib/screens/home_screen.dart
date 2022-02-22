import 'package:buletin/constants.dart';
import 'package:buletin/widgets/sidebar.dart';
import 'package:buletin/widgets/video_list.dart';
import 'package:buletin/widgets/channel_list.dart';
import 'package:buletin/widgets/title_home.dart';
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
