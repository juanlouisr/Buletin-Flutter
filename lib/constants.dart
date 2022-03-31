import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String appName = "Buletin.id";
const String baseUrl = "10.0.2.2:8080";
const String driveUrl = "https://drive.google.com/uc?id=";
const String channelListEndpoint = '/channel';
const String videoListEndpoint = '/video';
const String hotEndpoint = videoListEndpoint + "/hot";
const String categoryEndpoint = '/category';
const String playlistEndpoint = '/playlist';
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

const Color colorPrimary = Color(0xFFFF8282);
const Color colorGrey = Color(0xFF949494);
const Color colorBlack = Color(0xFF000000);
const Color colorWhite = Color(0xFFFFFFFF);

String pictureParser(String picture) {
  return (picture == "placeholder")
      ? "175-FYuW9aFusvctqZtoWkXXFmxN45-LN"
      : picture;
}
