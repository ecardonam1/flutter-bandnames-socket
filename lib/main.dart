import 'package:flutter/material.dart';

import 'package:band_names/src/services/socket_service.dart';
import 'package:provider/provider.dart';

import 'package:band_names/src/screens/home_screen.dart';
import 'package:band_names/src/screens/status_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomeScreen(),
            'status': ((_) => const StatusScreen())
          },
          home: const HomeScreen()),
    );
  }
}
