import 'package:flutter/material.dart';
import 'package:flutter_basics/models/cart.dart';
import 'package:flutter_basics/pages/cart_page.dart';
import 'package:flutter_basics/pages/home_page.dart';
import 'package:flutter_basics/pages/log_in_page.dart';
import 'package:flutter_basics/utils/my_routes.dart';
import 'package:flutter_basics/widgets/my_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartModal>(
  (ref) => CartNotifier(
    CartModal(),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => const LogInPage(),
        MyRoutes.loginRoute: (context) => const LogInPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
