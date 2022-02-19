import 'package:buletin/constants.dart';
import 'package:buletin/widgets/category_list.dart';
import 'package:buletin/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const CategoryList(),
      drawer: const SideNavigationBar(),
    );
  }
}