import 'package:flutter/material.dart';
import 'package:buletin/utils/extension_image.dart';

class AspectRatioImageNetwork extends StatelessWidget {
  final String image;
  final double aspectRatio;
  const AspectRatioImageNetwork({
    required this.image,
    required this.aspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.network(
        // sementara pakai url video
        image,
        fit: BoxFit.cover,
        errorBuilder: (context, exeption, stackTrace) {
          return Image.asset(
            'placeholder'.jpg,
          );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
