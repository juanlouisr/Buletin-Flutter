import 'package:buletin/api/video_api.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:flutter/material.dart';
import 'package:buletin/api/auth_api.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NewVideoComponent(),
            const SizedBox(height: 10,),
            VideoListParted(
              future: VideoAPI.getVideos(pageNo: 1, pageSize: 8),
              title: "Hot Videos",
              leading: Padding(
                padding: const EdgeInsets.all(8).copyWith(bottom: 9),
                child: SvgPicture.asset(
                  "assets/svg/flame.svg",
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            VideoListParted(
              future: VideoAPI.getVideoByInterests(1, 8),
              title: "For You",
            ),
          ],
        ),
      ),
    );
  }
}
