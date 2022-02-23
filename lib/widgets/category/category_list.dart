import 'package:buletin/constants.dart';
import 'package:buletin/models/category.dart';
import 'package:buletin/widgets/category/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ResponsiveGridList(
        desiredItemWidth: 200,
        minSpacing: 10,
        children: [
          'Entertainment',
          'Podcast',
          'Stories',
          'Newsroom',
          'Sport',
          'Classroom',
        ]
            .asMap().entries.map((e) =>  CategoryCard(
                  category: Category(
                      name: e.value, categoryId: e.key),
                ))
            .toList(),
      ),
    );
  }
}
