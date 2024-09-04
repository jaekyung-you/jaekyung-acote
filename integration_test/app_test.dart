import 'package:acote/main.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();

  group('end-to-end test', () {
    testWidgets('tap on the user, move to detail', (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.pumpAndSettle();

      String username = 'mojombo';
      final userItemKey = Key(username);
      expect(find.byKey(userItemKey), findsOneWidget);

      final fab = find.byKey(Key(username));
      
      await tester.tap(fab);
      
      await tester.pumpAndSettle();

      expect(find.text(username), findsWidgets);
    });

    testWidgets('tap on the ad banner, move to web page', (tester) async {
      await tester.pumpWidget(const MyApp());
    });

    testWidgets('pull to refresh, get all users newly', (tester) async {
      await tester.pumpWidget(const MyApp());
    });

    testWidgets('drag until the scroll ends, get more users', (tester) async {
      await tester.pumpWidget(const MyApp());
    });

    testWidgets('tap back button on the detail, go back', (tester) async {
      await tester.pumpWidget(const MyApp());
    });
  });
}
