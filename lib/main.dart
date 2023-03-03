import 'package:flutter/material.dart';

import 'Screens/Items.dart';
import 'Screens/Login_Screen.dart';

import 'Screens/RegisterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      home:  LoginScreen(),

      routes: {
        'LoginScreen': (context) =>  LoginScreen(),
        'RegisterScreen': (context) =>  RegisterScreen(),
        'ItemScreen': (context) =>  ItemClass(),

      },

    );
  }
}

