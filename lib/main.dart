import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/points_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PointsProvider(),
      child: MaterialApp(
        title: 'Coffee Shop App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          useMaterial3: true,
          fontFamily: 'Prompt',
        ),
        home: const LoginScreen(),
      ),
    );
  }
}