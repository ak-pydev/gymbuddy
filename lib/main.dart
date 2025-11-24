import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/auth/welcome_screen.dart';
import 'screens/main_navigation.dart';
import 'theme/theme_provider.dart';

// Set to true to skip login during development
const bool kSkipLogin = true;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MotionArcApp(),
    ),
  );
}

class MotionArcApp extends StatelessWidget {
  const MotionArcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Motion Arc',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFB8A4C9),
              onPrimary: Color(0xFFFFFFFF),
              primaryContainer: Color(0xFFE8DAEF),
              onPrimaryContainer: Color(0xFF6B5B7B),
              secondary: Color(0xFFF4C2C2),
              onSecondary: Color(0xFF5C3A3A),
              secondaryContainer: Color(0xFFFDE7E7),
              onSecondaryContainer: Color(0xFF8B6B6B),
              surface: Color(0xFFFFFBFF),
              onSurface: Color(0xFF4A4458),
              onSurfaceVariant: Color(0xFF7B7589),
              surfaceContainerHighest: Color(0xFFF5F0F8),
              outline: Color(0xFFD4C8DC),
              error: Color(0xFFBA1A1A),
              onError: Color(0xFFFFFFFF),
            ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Color(0xFF4A4458)),
              displayMedium: TextStyle(color: Color(0xFF4A4458)),
              displaySmall: TextStyle(color: Color(0xFF4A4458)),
              headlineLarge: TextStyle(color: Color(0xFF4A4458)),
              headlineMedium: TextStyle(color: Color(0xFF4A4458)),
              headlineSmall: TextStyle(color: Color(0xFF4A4458)),
              titleLarge: TextStyle(color: Color(0xFF4A4458)),
              titleMedium: TextStyle(color: Color(0xFF4A4458)),
              titleSmall: TextStyle(color: Color(0xFF4A4458)),
              bodyLarge: TextStyle(color: Color(0xFF6B5B7B)),
              bodyMedium: TextStyle(color: Color(0xFF6B5B7B)),
              bodySmall: TextStyle(color: Color(0xFF7B7589)),
              labelLarge: TextStyle(color: Color(0xFF4A4458)),
              labelMedium: TextStyle(color: Color(0xFF6B5B7B)),
              labelSmall: TextStyle(color: Color(0xFF7B7589)),
            ),
            scaffoldBackgroundColor: const Color(0xFFFFFBFF),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFB8A4C9),
              foregroundColor: Color(0xFFFFFFFF),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F0F8),
            ),
            cardTheme: CardThemeData(
              elevation: 0,
              color: const Color(0xFFFFFBFF),
              surfaceTintColor: const Color(0xFFE8DAEF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFE8DAEF)),
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFB8A4C9),
                foregroundColor: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFB8A4C9),
                side: const BorderSide(color: Color(0xFFB8A4C9)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xFFF4C2C2),
              foregroundColor: Color(0xFF5C3A3A),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFE8DCC8),
              onPrimary: Color(0xFF1C1C1C),
              secondary: Color(0xFFD4C5A9),
              onSecondary: Color(0xFF1C1C1C),
              surface: Color(0xFF1C1C1C),
              onSurface: Color(0xFFE8DCC8),
              onSurfaceVariant: Color(0xFFD4C5A9),
              surfaceContainerHighest: Color(0xFF2C2C2C),
              outline: Color(0xFF3D3D3D),
            ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Color(0xFFE8DCC8)),
              displayMedium: TextStyle(color: Color(0xFFE8DCC8)),
              displaySmall: TextStyle(color: Color(0xFFE8DCC8)),
              headlineLarge: TextStyle(color: Color(0xFFE8DCC8)),
              headlineMedium: TextStyle(color: Color(0xFFE8DCC8)),
              headlineSmall: TextStyle(color: Color(0xFFE8DCC8)),
              titleLarge: TextStyle(color: Color(0xFFE8DCC8)),
              titleMedium: TextStyle(color: Color(0xFFE8DCC8)),
              titleSmall: TextStyle(color: Color(0xFFE8DCC8)),
              bodyLarge: TextStyle(color: Color(0xFFD4C5A9)),
              bodyMedium: TextStyle(color: Color(0xFFD4C5A9)),
              bodySmall: TextStyle(color: Color(0xFFD4C5A9)),
              labelLarge: TextStyle(color: Color(0xFFE8DCC8)),
              labelMedium: TextStyle(color: Color(0xFFD4C5A9)),
              labelSmall: TextStyle(color: Color(0xFFD4C5A9)),
            ),
            scaffoldBackgroundColor: const Color(0xFF1C1C1C),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1C1C1C),
              foregroundColor: Color(0xFFF5F5F0),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
          themeMode: themeProvider.themeMode,
          home: kSkipLogin ? const MainNavigation() : const WelcomeScreen(),
        );
      },
    );
  }
}
