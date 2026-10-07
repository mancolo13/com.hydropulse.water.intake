import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WinApp());
}

class WinApp extends StatelessWidget {
  const WinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Win',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}
