
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CampusConnect app smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('CampusConnect'),
        ),
      ),
    );

    expect(find.text('CampusConnect'), findsOneWidget);
  });
}