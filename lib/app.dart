import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

class PmrOralBoardsApp extends StatelessWidget {
  const PmrOralBoardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PM&R Oral Boards',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomeScreen(),
    );
  }
}
