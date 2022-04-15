import 'package:buletin/api/category_api.dart';
import 'package:buletin/utils/constants.dart';
import 'package:buletin/models/category.dart';
import 'package:buletin/widgets/category/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 0),
      child: FutureBuilder(
        future: CategoryAPI.getCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) { 
            final categories = snapshot.data as List<Category>;
            return ResponsiveGridRow(
                children: [...categories
                    .map((e) => ResponsiveGridCol(
                          child: CategoryCardNew(
                            category: e,
                          ),
                          lg: 2,
                          md: 3,
                        ))
                    .toList(), ...categories
                    .map((e) => ResponsiveGridCol(
                          child: CategoryCardNew(
                            category: e,
                          ),
                          lg: 2,
                          md: 3,
                        ))
                    .toList()]);
          } else {
            return const Center(
              child: Text("Tidak ada category"),
            );
          }
        },
      ),
    );
  }
}
