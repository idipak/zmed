import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/screens/dashboard.dart';
import 'package:todo/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return MaterialApp(
      title: 'TODO App',
      theme: theme.darkThem(),
      home: Dashboard(),
    );
  }
}
