import 'package:flutter/material.dart';
import 'screens/menu.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
// Ini cuma setup awal aja, simpel banget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      // Theme hitam putih biar keliatan clean & minimalis
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MenuPage(),
      debugShowCheckedModeBanner: false, // Ilangin banner debug di pojok
    );
  }
}