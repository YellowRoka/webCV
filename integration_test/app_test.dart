import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:cv_2022_06_30/main.dart' as app;


//RUN:
//flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d chrome

void main()  async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await testDrawerOpen();
}

Future<void> testDrawerOpen() async {
  group('end-to-end test',(){  
    testWidgets(
      'drawer open', 
      (WidgetTester tester) async {
        //init
        app.main(); 
        await tester;
        await tester.pumpAndSettle();
       
        //setup
        //final Finder button = find.byIcon(Icons.menu_book_sharp);
        final Finder button = find.bySubtype<FloatingActionButton>();
        await Future.delayed( const Duration(seconds: 5));
        await tester.tap(button);
        await Future.delayed( const Duration(seconds: 3));
  
        //testing
        await tester.pumpAndSettle();
        await Future.delayed( const Duration(seconds: 3));
        //results
        expect(find.bySubtype<ElevatedButton>(), findsNWidgets(4));
      }
    );
  });
}
