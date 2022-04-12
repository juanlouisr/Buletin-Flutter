import 'package:flutter/material.dart';
import 'package:buletin/templates/screen_template.dart';
import 'package:buletin/widgets/video/video_list.dart';
import 'package:buletin/api/video_api.dart';
import 'package:provider/provider.dart';
import 'package:buletin/api/auth_api.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}): super(key: key);
  
  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    String? identifier = context.read<AuthApi>().viewerId ?? '';

    return ScreenTemplate(
      useSidebar: true, 
      child: SingleChildScrollView(
        child: VideoListParted(
          future: VideoAPI.getHistoryVideo(pageNo: 1, pageSize: 100, viewerId: identifier!),
          title: "History",
        )
      ),
    );
  }
}