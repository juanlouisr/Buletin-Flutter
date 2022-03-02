import 'package:buletin/constants.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:buletin/widgets/channel/channel_list.dart';
import 'package:buletin/widgets/other/title_home.dart';
import 'package:flutter/material.dart';
import 'package:buletin/api/auth_api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }
  
  void checkUser() {
    Provider.of<AuthApi>(context, listen: false).checkUser();
  }

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
