import 'package:flutter/material.dart';

import 'xo/login.dart';
import 'xo/xo_game.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: LoginScreen.routeName,
    routes: {
      LoginScreen.routeName: (context) => const LoginScreen(),
      XoGameScreen.routeName: (context) => XoGameScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: LoginScreen(),
    );
  }
}
