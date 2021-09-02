// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:epicture/LoginPage.dart';
import 'package:epicture/Profil.dart';
import 'package:epicture/StyleText/Titre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:epicture/main.dart';

void main() {
  testWidgets('Verification de la méthode Titre', (WidgetTester tester) async {
    var titre = Titre("test");
    expect(titre.data, "test");
    expect(titre.style.fontWeight, FontWeight.bold);
    expect(titre.style.fontSize, 50);
  });

  testWidgets('Verification de la méthode LoginPage', (WidgetTester tester) async {
    var titre = LoginPage();
    expect(titre.toString(), "LoginPage");
  });

  testWidgets('Verification de la méthode Profils', (WidgetTester tester) async {
    var titre = Profil();
    expect(titre.toString(), "Profil");
  });


  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    //expect(find.text('0'), findsOneWidget);
    //expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('0'), findsNothing);
   // expect(find.text('1'), findsOneWidget);
  // });
}