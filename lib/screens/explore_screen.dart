import 'package:buletin/utils/constants.dart';
import 'package:buletin/widgets/category/category_list.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:buletin/widgets/other/appbar.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> interests = ["Music", "Technology", "Education", "News", "Sport"];
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children:  [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                children: List.from(interests.map((interest) => 
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Chip(
                      padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
                      label: Text(
                        interest,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                      backgroundColor: colorPrimary,
                    )
                  )
                )),
              ),
          ),
          
          CategoryList(),
        ],
      ),
      drawer: const SideNavigationBar(),
    );
  }
}
