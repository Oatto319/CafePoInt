  import 'package:flutter/material.dart';
  import 'screens/login_screen.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Coffee Shop App',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          useMaterial3: true,
          fontFamily: 'Prompt',
        ),
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      );
    }
  }