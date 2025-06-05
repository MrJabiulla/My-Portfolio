import 'package:flutter/material.dart';
import 'core/constants/app_string.dart';
import 'core/theme/app_theme.dart';
import 'features/home/view/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Follows system theme
      home: const HomeScreen(),
    );
  }
}