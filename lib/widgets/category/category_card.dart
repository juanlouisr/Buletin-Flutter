import 'package:buletin/constants.dart';
import 'package:buletin/models/category.dart';
import 'package:buletin/widgets/category/category_detail.dart';
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
    return Container(
      margin: const EdgeInsets.all(4),
      child: Card(
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
                  categoryId: category.id,
                ),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatioImageNetwork(
                image: category.getPictureUrl(),
                aspectRatio: 2.6,
              ),
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
      ),
    );
  }
}
