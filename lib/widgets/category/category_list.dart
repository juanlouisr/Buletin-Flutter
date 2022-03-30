import 'package:buletin/api/category_api.dart';
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
      padding: const EdgeInsets.all(30),
      child: Center(
        child: FutureBuilder(
          future: CategoryAPI.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final categories = snapshot.data as List<Category>;
              return ResponsiveGridRow(
                  children: categories
                      .map((e) => ResponsiveGridCol(
                            child: CategoryCard(
                              category: e,
                            ),
                            xs: 12,
                            md: 4,
                          ))
                      .toList());
            } else {
              return const Center(
                child: Text("Tidak ada category"),
              );
            }
          },
        ),
      ),
    );
  }
}
