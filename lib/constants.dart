import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String appName = "Buletin.id";
const String baseUrl = "10.0.2.2:8080";
const String driveUrl = "https://drive.google.com/uc?id=";
const String channelListEndpoint = '/channel';
const String videoListEndpoint = '/video';
const String videoViewEndpoint = '/video-view';
const String hotEndpoint = videoListEndpoint + "/hot";
const String categoryEndpoint = '/category';
const String playlistEndpoint = '/playlist';
const String historyEndpoint = '/history';
const String loginEndpoint = '/login';
const String registerEndpoint = '/user';
const String changePasswordEndpoint = '/user';
const String forgotPasswordEndpoint = '/forgot';
const String profileEndpoint = '/profile';
const String interestEndpoint = '/interest';

const double cardAspectRatio = 2.2;
const double cardElevation = 5;
const double cardBorderRadius = 12;
const double paddingSize = 8;
const double marginSize = 5;
const double titleFontSize = 16;
const FontWeight titleFontWeight = FontWeight.w500;

TextStyle poppins = GoogleFonts.poppins();

const Color colorPrimary = Color(0xFFFF6868);
const Color colorGrey = Color(0xFF949494);
const Color colorBlack = Color(0xFF000000);
const Color colorWhite = Color(0xFFFFFFFF);

const Map<int, Color> kPrimarySwatch = {
  50: Color(0xFFFFD7C2),

};


MaterialColor primarySwatch = const MaterialColor(
    0xFFFF6868,
    <int, Color>{
       50: Color.fromARGB(255, 255, 187, 187),
      100: Color.fromARGB(255, 248, 163, 163),
      200: Color.fromARGB(255, 252, 143, 143),
      300: Color(0xFFFF8282),
      400: Color.fromARGB(255, 252, 119, 119),
      500: Color.fromARGB(255, 255, 98, 98),
      600: Color.fromARGB(255, 252, 86, 86),
      700: Color.fromARGB(255, 252, 68, 68),
      800: Color.fromARGB(255, 255, 50, 50),
      900: Color.fromARGB(255, 247, 18, 18),
    },
  );

String pictureParser(String picture) {
  return (picture == "placeholder")
      ? "175-FYuW9aFusvctqZtoWkXXFmxN45-LN"
      : picture;
}
