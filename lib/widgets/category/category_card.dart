import 'package:buletin/constants.dart';
import 'package:buletin/models/category.dart';
import 'package:buletin/screens/category_detail.dart';
import 'package:buletin/widgets/other/aspect_ratio_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      elevation: cardElevation,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetail(
                      categoryId: category.categoryId,
                    )),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const AspectRatioImageNetwork(
                image: 'http://www.fnordware.com/superpng/pnggrad16rgb.png',
                aspectRatio: 2.5),
            Center(
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
