import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/utils/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bumble Clone',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        Constants.loginRoute: (context) => LoginScreen(),
        Constants.registerRoute: (context) => RegisterScreen(),
        Constants.homeRoute: (context) => HomeScreen(),
        Constants.profileRoute: (context) => ProfileScreen(),
        Constants.chatRoute: (context) => ChatScreen(),
        Constants.matchRoute: (context) => MatchScreen(),
      },
    );
  }
}