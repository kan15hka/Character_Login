import 'package:charachter_login/auth_screen.dart';
import 'package:charachter_login/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character Login Animation',
      theme: ThemeData(
          fontFamily: 'Poppins',
          outlinedButtonTheme: Constants.outlinedButtonTheme,
          inputDecorationTheme: Constants.inputDecorationTheme),
      home: const AuthScreen(),
    );
  }
}
