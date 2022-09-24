import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friverpod/config/themeconfig.dart';
import 'package:friverpod/dbservices/dbservices.dart';
import 'package:friverpod/screens/home.dart';

void main() {
  NotesDb notes = NotesDb();
  runApp(const ProviderScope(overrides: [], child: MyApp()));
  notes.initDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeConfug.lightMode,
      darkTheme: ThemeConfug.darkMode,
      home: const HomeScreen(),
    );
  }
}
