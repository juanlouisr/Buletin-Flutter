import 'package:buletin/widgets/other/appbar.dart';
import 'package:buletin/widgets/other/sidebar.dart';
import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  final bool useSidebar;
  final Widget child;

  const ScreenTemplate({
    Key? key,
    required this.useSidebar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: useSidebar ? const SideNavigationBar() : null,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12), // Ganti aja ininya
        child: child,
      ),
    );
  }
}
