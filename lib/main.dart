import 'package:flutter/material.dart';
import 'package:flutter_restaurantapp/models/shop.dart';
import 'package:flutter_restaurantapp/pages/cartPage.dart';
import 'package:provider/provider.dart';
import 'pages/IntroPage.dart';
import 'pages/MenuPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/menupage': (context) => const MenuPage(),
          '/cartpage':(context) => const CartPage(),
        });
  }
}
