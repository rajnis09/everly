import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomThemeData {
  // Level 1 color (darkest of all), Used for AppBar Titles etc.
  static final Color blackColorShade1 = Color(0xFF0F111A);
  // Level 2 Color (less darker than level 1)
  static final Color blackColorShade2 = Color(0xFF31354B);
  // Level 3 Color (less darker than level 2)
  static final Color blackColorShade3 = Color(0xFF46495E);
  // Grey color
  static final Color greyColorShade = Color(0xFF9E9E9E);
  // Blue color level 1
  static final Color blueColorShade1 = Color(0xFF1B98E0);
  // Blue color level 2
  static final Color blueColorShade2 = Color(0xFF40C4FF);

  // For now it's pure white color
  static final Color whiteColor = Colors.white;
  // Roboto used for titles, headings etc.
  static final robotoFont = GoogleFonts.roboto();
  // Lato used for subtitles etc
  static final latoFont = GoogleFonts.lato();
  // Montserrat used for descriptions etc
  static final montserratFont = GoogleFonts.montserrat();
  const CustomThemeData();
}
