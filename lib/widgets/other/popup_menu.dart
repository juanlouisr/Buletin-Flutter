import 'package:flutter/material.dart';

class CustomPopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? child;
  final Widget? icon;
  const CustomPopUpMenu({ Key? key, required this.menuList, this.child, this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => menuList,
      child: child,
      icon: icon,
      // shape: BorderRadius.all(25),
    );
  }
}