import 'package:buletin/constants.dart';
import 'package:buletin/models/category.dart';
import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/widgets/playlist/playlist_list.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  final Category category;
  const CategoryDetail({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double contentHeight = deviceSize.height - 56 - statusBarHeight;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                // category.getPictureUrl(),
                "https://images.unsplash.com/photo-1495017790122-c765562a8917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              Text(
                category.name,
                style: poppins.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                  color: colorPrimary.withOpacity(0.8),
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: contentHeight - 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: PlaylistList(
                categoryId: category.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
