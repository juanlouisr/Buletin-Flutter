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
                  category: category,
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

class CategoryCardNew extends StatelessWidget {
  final Category category;
  final Color? titleColor;

  const CategoryCardNew({
    Key? key,
    required this.category,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetail(
                category: category,
              ),
            ));
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.network(
                category.getPictureUrl(),
                width: 150,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      color: colorPrimary.withOpacity(0.1),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: poppins.copyWith(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: titleColor ?? colorBlack,
                    ),
                  ),
                  Text(
                    "? playlist",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: poppins.copyWith(
                      fontSize: 14.0,
                      color: colorGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
