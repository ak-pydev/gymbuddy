import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MotionArcApp());
}

class MotionArcApp extends StatelessWidget {
  const MotionArcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motion Arc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2C2C2C),
          onPrimary: Color(0xFFF5F5F0),
          secondary: Color(0xFF3D3D3D),
          onSecondary: Color(0xFFF5F5F0),
          surface: Color(0xFFFAFAF8),
          onSurface: Color(0xFF1C1C1C),
          surfaceContainerHighest: Color(0xFFE8E8E5),
          outline: Color(0xFFD0D0CC),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAFAF8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1C1C),
          foregroundColor: Color(0xFFF5F5F0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: const Color(0xFFF5F5F0),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: const Color(0xFFFAFAF8),
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE8E8E5)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF2C2C2C),
            foregroundColor: const Color(0xFFF5F5F0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF2C2C2C),
            side: const BorderSide(color: Color(0xFF2C2C2C)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF5F5F0),
          onPrimary: Color(0xFF1C1C1C),
          secondary: Color(0xFFE8E8E5),
          onSecondary: Color(0xFF1C1C1C),
          surface: Color(0xFF1C1C1C),
          onSurface: Color(0xFFF5F5F0),
          surfaceContainerHighest: Color(0xFF2C2C2C),
          outline: Color(0xFF3D3D3D),
        ),
        scaffoldBackgroundColor: const Color(0xFF1C1C1C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1C1C),
          foregroundColor: Color(0xFFF5F5F0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: const Color(0xFF2C2C2C),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: const Color(0xFF1C1C1C),
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFF2C2C2C)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFF5F5F0),
            foregroundColor: const Color(0xFF1C1C1C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFF5F5F0),
            side: const BorderSide(color: Color(0xFFF5F5F0)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const LoginScreen(),
    );
  }
}
