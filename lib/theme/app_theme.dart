import 'package:flutter/material.dart';

class AppTheme {
  // Spacing System
  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;
  static const double space2xl = 48.0;

  // Border Radius
  static const double radiusSm = 12.0;
  static const double radiusMd = 16.0;
  static const double radiusLg = 20.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 999.0;

  // Elevation/Shadow
  static List<BoxShadow> shadowSm(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> shadowMd(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.15),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> shadowLg(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.2),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> shadowColored(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.4),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  // Animation Durations
  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // Common Decorations
  static BoxDecoration cardDecoration(BuildContext context) {
    final theme = Theme.of(context);
    return BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(radiusLg),
      border: Border.all(
        color: theme.colorScheme.outline.withValues(alpha: 0.2),
        width: 1,
      ),
      boxShadow: shadowSm(Colors.black),
    );
  }

  static BoxDecoration gradientCardDecoration(Color color1, Color color2) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [color1, color2],
      ),
      borderRadius: BorderRadius.circular(radiusLg),
      boxShadow: shadowColored(color1),
    );
  }

  static BoxDecoration iconContainerDecoration(Color color) {
    return BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(radiusMd),
    );
  }
}
