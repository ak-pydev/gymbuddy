// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:gymbuddy/main.dart';
import 'package:gymbuddy/theme/theme_provider.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MotionArcApp(),
      ),
    );

    // Verify that the app loads
    await tester.pumpAndSettle();

    // Check if Motion Arc text is present (either in login or home screen)
    expect(
      find.textContaining('Motion Arc', findRichText: true),
      findsAtLeastNWidgets(1),
    );
  });
}
