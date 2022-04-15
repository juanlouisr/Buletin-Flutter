import 'package:buletin/utils/constants.dart';

class Category {
  final int id;
  final String name;
  final String picture;

  Category({
    required this.id,
    required this.name,
    required this.picture,
  });

  String getPictureUrl() => driveUrl + picture;

  factory Category.fromMap(Map<String, dynamic> map) {
    final int id = map['category_id'] as int;
    final String name = map['category_name'] as String;
    final picture = pictureParser(map['category_picture']);

    return Category(
      id: id,
      name: name,
      picture: picture,
    );
  }
}
