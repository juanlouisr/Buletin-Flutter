import 'package:buletin/constants.dart';
import 'package:buletin/widgets/category/category_list.dart';
import 'package:buletin/widgets/search/searchbar.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 120,
              right: 120,
            ),
            child: RoundedSearchInput(
              textController: textController,
              hintText: "Cari video",
            ),
          ),
          const CategoryList(),
        ],
      ),
      drawer: const SideNavigationBar(),
    );
  }
}
