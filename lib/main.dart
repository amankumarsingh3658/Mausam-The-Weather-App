import 'package:flutter/material.dart';
import 'package:mausam/Screens/homepage.dart';
import 'package:mausam/Screens/splashscreens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueAccent, primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
