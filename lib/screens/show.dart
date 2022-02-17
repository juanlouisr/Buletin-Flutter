import 'package:flutter/material.dart';
import 'package:buletin/widgets/video_player.dart';
import 'package:buletin/widgets/video_card_show.dart';
import 'package:buletin/dummy/list_test.dart';
import 'package:buletin/models/dummy_video.dart';

class Show extends StatelessWidget {
  late List<DummyVideo> test = dummyListTest;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final column1 = widthScreen / 10 * 6.5;
    final column2 = widthScreen - column1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Buletin')
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                VideoPlayer(),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  width: column2,
                  child: ListView.builder(
                    itemCount: test.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctx, int index) {
                      return VideoCardShow(test[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ), 
      );
  }
}