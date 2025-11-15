// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/home_navigator_page.dart';

void main() {
  runApp(const KuisDanProfileApp());
}

class KuisDanProfileApp extends StatelessWidget {
  const KuisDanProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis UI/UX & GitHub Profile',
      debugShowCheckedModeBanner: false,
      home: const HomeNavigatorPage(), // Mengarahkan ke halaman navigasi
      theme: ThemeData(
        // Pengaturan Tema Utama
        scaffoldBackgroundColor: Colors.grey[100], 
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo, 
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.amber),
      ),
    );
  }
}