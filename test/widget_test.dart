// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:bbkhd/main.dart';

void main() {
  testWidgets('Home loan submitted screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterApp());

    expect(find.text('Home Loan Application Submitted!'), findsOneWidget);
    expect(find.text('648715188'), findsOneWidget);
    expect(find.text('₹90,00,000'), findsOneWidget);
  });
}
