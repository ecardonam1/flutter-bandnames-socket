import 'package:flutter/material.dart';

import 'package:band_names/src/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {'home': (_) => const HomeScreen()},
        home: HomeScreen());
  }
}
