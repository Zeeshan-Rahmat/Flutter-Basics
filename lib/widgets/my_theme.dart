import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // Light Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);

  // Dark Colors
  static Color dark_primaryColor = const Color.fromRGBO(39, 55, 77, 1);
  static Color dark_secondaryColor = const Color.fromRGBO(82, 109, 130, 1);
  static Color dark_ternaryColor = const Color.fromRGBO(157, 178, 191, 1);
  static Color dark_brightColor = const Color.fromRGBO(221, 230, 237, 1);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: creamColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        scaffoldBackgroundColor: creamColor,
        useMaterial3: true,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: dark_primaryColor),
        primaryColor: dark_secondaryColor,
        primaryColorDark: dark_primaryColor,
        primaryColorLight: dark_brightColor,
        textTheme: customTextTheme(),
        scaffoldBackgroundColor: dark_primaryColor,
        shadowColor: dark_primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: dark_secondaryColor,
          ),
          labelStyle: TextStyle(
            color: dark_ternaryColor,
          ),
        ),
        cardTheme: CardTheme(
          color: dark_secondaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(dark_primaryColor),
            textStyle: WidgetStatePropertyAll(TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: MyTheme.dark_brightColor,
              fontSize: 12,
            )),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: dark_secondaryColor,
        ),
        iconTheme: IconThemeData(
          color: dark_brightColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: dark_secondaryColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: dark_brightColor),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: dark_brightColor,
            fontSize: 20,
          ),
        ),
      );
}

TextTheme customTextTheme() {
  return TextTheme(
    headlineLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_brightColor,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_ternaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_brightColor,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_brightColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_brightColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_brightColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_brightColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_ternaryColor,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_ternaryColor,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: MyTheme.dark_ternaryColor,
      fontSize: 14,
    ),
  );
}
