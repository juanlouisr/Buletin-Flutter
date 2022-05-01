import 'package:flutter/material.dart';
import 'package:buletin/utils/constants.dart';

class TitleHome extends StatelessWidget {
  late String title;

  TitleHome(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4 * marginSize, left: 4 * marginSize, top: 3 * marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24)
          ),
          const Divider()
        ],
      ),
    );
  }
}