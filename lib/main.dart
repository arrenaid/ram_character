import 'package:flutter/material.dart';
import 'package:ram_character/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty Character',
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}