import 'package:buletin/screens/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:buletin/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buletin/utils/extension_image.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  // final TextEditingController textController = TextEditingController();

  const CustomAppBar({
    this.height = kToolbarHeight,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool clicked = false;
  SvgPicture searchIcon = SvgPicture.asset(
    'search'.svg,
    color: colorWhite,
  );
  Widget searchBar = const Text('');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: searchBar,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (!clicked) {
                searchIcon = SvgPicture.asset(
                  'cross'.svg,
                  color: colorWhite,
                );
                searchBar = TextField(
                  autofocus: true,
                  // controller: widget.textController,
                  onSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchResultScreen(
                                  textController: TextEditingController(),
                                  titleSearch: value,
                                )));
                  },
                  // onChanged: (value) {
                  //   //Do something wi
                  // },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Cari Video',
                  ),
                );
              } else {
                searchIcon = SvgPicture.asset(
                  'search'.svg,
                  color: colorWhite,
                );
                searchBar = const Text('');
              }
              clicked = !clicked;
            });
          },
          icon: searchIcon,
        ),
        const SizedBox(
          width: 16,
        ),
        Center(
          child: Text(
            appName,
            style: poppins.copyWith(fontSize: 20),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
