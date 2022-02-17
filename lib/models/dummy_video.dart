import 'package:flutter/material.dart';


class DummyVideo {
  late String name;
  late String channelName;
  late String thumbnail;

  DummyVideo(String name, String channelName, String thumbnail) {
    this.name = name;
    this.channelName = channelName;
    this.thumbnail = thumbnail;
  }

  String? getName()
  {
    return name;
  }
}