import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/home_page.dart';
import 'package:flutter_basics/pages/log_in_page.dart';
import 'package:flutter_basics/utils/my_routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        '/': (context) => const LogInPage(),
        MyRoutes.loginRoute: (context) => const LogInPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
