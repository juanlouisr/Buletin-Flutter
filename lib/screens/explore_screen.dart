import 'package:buletin/constants.dart';
import 'package:buletin/widgets/category/category_list.dart';
import 'package:buletin/widgets/search/searchbar.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:buletin/widgets/other/appbar.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: const [
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 20,
          //     left: 100,
          //     right: 100,
          //     bottom: 20,
          //   ),
          //   child: RoundedSearchInput(
          //     textController: textController,
          //     hintText: "Cari video",
          //   ),
          // ),
          CategoryList(),
        ],
      ),
      drawer: const SideNavigationBar(),
    );
  }
}
