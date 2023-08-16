import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:web_cv/main.dart' as app;


//RUN:
//flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d chrome

void main() async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await mainTest();
  /*await goToPersonal();
  await goToJobs();
  await goToSchools();
  await goToJobs();*/
  

}

const int mainDelayTimeInMiliSec = 6500;
const int subDelayTimeInMiliSec  = 3000;

Future<void> mainTest() async {
  group('main end-to-end test',(){  
    testWidgets(
      'drawer open', 
      (WidgetTester tester) async {
        /*init*/
        await setupApp(tester);

        /*test*/
        final Finder button = find.byIcon(Icons.menu);

        await tester.tap(button,warnIfMissed: false);
        await tester.pump();

        //expect(button, findsOneWidget);
        debugPrint("button: $button");
       
        /*results*/
        final Finder menu = find.byType(Drawer);
        debugPrint("menu: $menu"); 
        //expect(menu, findsOneWidget);
        await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));

        /*close*/
        await tester.dragFrom(const Offset(500.0, 300.0), const Offset(0.0, 300.0));
        await tester.pump();
        await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
      }
    );
    testWidgets("go to personal", (WidgetTester tester) async{
      await setupApp(tester);

      await tester.dragFrom(const Offset(0.0, 300.0), const Offset(1500.0, 300.0));
      await tester.pump();
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));

      final Finder bPersonal = find.byIcon(Icons.person);

      await tester.tap(bPersonal,warnIfMissed: false);
      await tester.pump();

      //expect(bPersonal, findsOneWidget);
      debugPrint("button: $bPersonal");
      
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
      final Finder text = find.byKey(const Key("cdata"));
      debugPrint("text: $text");
      //expect(text, findsOneWidget);
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
    });
    testWidgets("go to jobs", (WidgetTester tester) async{
      await setupApp(tester);

      await tester.dragFrom(const Offset(0.0, 300.0), const Offset(1500.0, 300.0));
      await tester.pump();
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));

      final Finder bJobs = find.byIcon(Icons.factory_outlined);
      
      await tester.tap(bJobs,warnIfMissed: false);
      await tester.pump();

      //expect(bJobs, findsOneWidget);
      debugPrint("button: $bJobs");
      
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
      final Finder text = find.byKey(const Key("cjobs"));
      debugPrint("text: $text");
      //expect(text, findsOneWidget);
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
    });
    testWidgets("go to schools", (WidgetTester tester) async{
      await setupApp(tester);
      
      await tester.dragFrom(const Offset(0.0, 300.0), const Offset(1500.0, 300.0));
      await tester.pump();
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));

      final Finder bSchools = find.byIcon(Icons.school_outlined);
      
      await tester.tap(bSchools,warnIfMissed: false);
      await tester.pump();

      //expect(bSchools, findsOneWidget);
      debugPrint("button: $bSchools");
      
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
      final Finder text = find.byKey(const Key("cschools"));
      debugPrint("text: $text");
      //expect(text, findsOneWidget);
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
    });
    testWidgets("go to skills", (WidgetTester tester) async{
      await setupApp(tester);

      await tester.dragFrom(const Offset(0.0, 300.0), const Offset(1500.0, 300.0));
      await tester.pump();
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));

      final Finder bSkills = find.byIcon(Icons.add_chart_sharp);
      
      await tester.tap(bSkills,warnIfMissed: false);


          final listFinder = find.byKey(const Key('mainlist'));
          final itemFinder = find.byKey(const Key('cskills'));

          // Scroll until the item to be found appears.
          await tester.scrollUntilVisible(
            itemFinder,
            500.0,
            scrollable: listFinder,
          );

      await tester.pump();

      //expect(bSkills, findsOneWidget);
      debugPrint("button: $bSkills");
      
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
      final Finder text = find.byKey(const Key("cskills"));
      debugPrint("text: $text");
      //expect(text, findsOneWidget);
      await Future.delayed( const Duration(milliseconds: subDelayTimeInMiliSec));
    });
  
  });
}

Future<void> setupApp(WidgetTester tester) async {
  app.main(); 
  //await tester;
  await tester.pumpAndSettle();
  await tester.pumpWidget( const app.MyApp());
  await Future.delayed( const Duration(milliseconds: mainDelayTimeInMiliSec));
}
