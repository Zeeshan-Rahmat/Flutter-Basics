import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/home_page.dart';
import 'package:flutter_basics/pages/log_in_page.dart';
import 'package:flutter_basics/utils/my_routes.dart';
import 'package:flutter_basics/widgets/my_theme.dart';

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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => const LogInPage(),
        MyRoutes.loginRoute: (context) => const LogInPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
