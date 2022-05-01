import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:buletin/models/channel_info.dart';
import 'package:buletin/models/video_info.dart';
import 'package:buletin/widgets/video/video_card.dart';
import 'package:buletin/widgets/channel/channel_information.dart';
import 'package:buletin/api/video_api.dart';
import 'package:buletin/api/channel_api.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ChannelScreen extends StatefulWidget {
  final channelInfo;
  const ChannelScreen({Key? key, @required this.channelInfo}): super(key: key);
  
  @override
  _ChannelScreen createState() => _ChannelScreen();
}

class _ChannelScreen extends State<ChannelScreen> {
  Future? _future;
  Future<dynamic> sendData() async {
    final dataVideo = await VideoAPI.getVideos(
      pageNo: 1,
      pageSize: 100,
      channelId: channelInfo.channelId,
    );
    final dataChannel = await ChannelAPI.get(
      pageNo: 1,
      pageSize: 100,
      ownerId: channelInfo.ownerId
    );
    return [dataVideo, dataChannel];
  }

  late String currentTab;
  late ChannelInfo channelInfo;
  late List<VideoInfo> videos;

  @override
  void initState() {
    super.initState();
    channelInfo = widget.channelInfo;
    currentTab = 'video';
    _future = sendData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: FutureBuilder<dynamic>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            
            var videos = snapshot.data[0] as List<VideoInfo>;
            var channels = snapshot.data[1] as List<ChannelInfo>;
            return SingleChildScrollView(
              child: ResponsiveGridRow(
                children: currentTab == 'video' ? [...channelInformation(), ...generateVideos(videos)] : [...channelInformation(), ...generateRelatedChannel(channels)],
              )
            );
          },
        ),
        drawer: const SideNavigationBar(),
      );
  }

  List<ResponsiveGridCol> channelInformation() {
    return [
      ResponsiveGridCol(
        lg: 12,
        child: Container(
          alignment: const Alignment(0, 0),
          color: const Color.fromRGBO(238, 238, 238, 100),
          child: ChannelInformation(
            channelInfo: channelInfo,
            width: 75,
            fontSizeTitle: 24,
            fontSizeSubtitle: 14,
          ),
        ),
      ),
      ResponsiveGridCol(
        lg: 6,
        child: InkWell(
          onTap: () {
            setState(() {
              currentTab = 'video';
            });
          },
          child: currentTab == 'video' ? activeTab('Videos') : unactiveTab('Videos'),
        ),
      ),
      ResponsiveGridCol(
        lg: 6,
        child: InkWell(
          onTap: () {
            setState(() {
              currentTab = 'channel';
            });
          },
          child: currentTab == 'channel' ? activeTab('Channels') : unactiveTab('Channels'),
        ),
      ),
    ];
  }

  List<ResponsiveGridCol> generateVideos(List<VideoInfo> videos) {
    return [
      ResponsiveGridCol(
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          child: ResponsiveGridRow(
            children: videos.map((i) {
              return ResponsiveGridCol(
                lg: 3,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: VideoCardNew(videoInfo: i),
                ),
              );
            }).toList(),
          ),
        )
      )
    ];
  }

  List<ResponsiveGridCol> generateRelatedChannel(List<ChannelInfo> channels) {
    return channels.map((i) {
      return ResponsiveGridCol(
        lg: 2,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelScreen(channelInfo: i)));
          },
          child: ChannelInformation(
            channelInfo: i,
            width: 100,
            fontSizeTitle: 14,
            fontSizeSubtitle: 10,
          ),
        ),
      );
    }).toList();
  }

  Widget activeTab(String text) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      alignment: const Alignment(0, 0),
      color: const Color.fromRGBO(255, 130, 130, 100),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }

  Widget unactiveTab(String text) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      alignment: const Alignment(0, 0),
      color: const Color.fromARGB(156, 225, 225, 225),
      child: Text(
        text,
        style: GoogleFonts.poppins()
      ),
    );
  }
}