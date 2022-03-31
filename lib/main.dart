import 'package:buletin/constants.dart';
import 'package:buletin/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buletin/api/auth_api.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AuthApi(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: primarySwatch,
        fontFamily: poppins.fontFamily,
      ),
      home: HomeScreen(),
    );
  }
}
