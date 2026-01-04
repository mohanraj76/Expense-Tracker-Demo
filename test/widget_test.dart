// Basic smoke test for Expense Tracker app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_site/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Expense Tracker app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ExpenseTrackerApp());
    await tester.pumpAndSettle();

    // Verify that our app title is displayed.
    expect(find.text('Expense Tracker'), findsOneWidget);

    // Verify that the summary card is shown.
    expect(find.text('Expense Summary'), findsOneWidget);

    // Verify that the FAB is present.
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
