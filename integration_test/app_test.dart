import 'package:acote/main.dart';
import 'package:acote/presentation/user_list/user_list_item_widget.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'url_launcher_wrapper.dart';

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

      final fab = find.byKey(userItemKey);
      
      await tester.tap(fab);
      
      await tester.pumpAndSettle();

      expect(find.text(username), findsWidgets);
    });


    testWidgets('tap on the ad banner, move to web page', (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.pumpAndSettle();

      String bannerItem = 'banner:1';
      final bannerItemKey = Key(bannerItem);
      expect(find.byKey(bannerItemKey), findsOneWidget);

      // 버튼 탭
      final fab = find.byKey(bannerItemKey);

      await tester.tap(fab);
      await tester.pumpAndSettle();

      Uri uri = Uri.parse('https://taxrefundgo.kr');

      final mockUrlLauncher = MockUrlLauncherWrapper();
      print(mockUrlLauncher.launchUrlWrapped(uri));

      verify(mockUrlLauncher.launchUrlWrapped(uri)).called(1);
    });

    testWidgets('pull to refresh, get all users newly', (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.pumpAndSettle();

      final listFinder = find.byType(ListView);
      expect(listFinder, findsWidgets);

      // 기존 아이템 확인
      String username = 'mojombo';
      final userItemKey = Key(username);
      expect(find.byKey(userItemKey), findsOneWidget);

      // 리스트를 아래로 당겨 Pull to Refresh 실행
      await tester.drag(listFinder, const Offset(0, 300)); // 아래로 스크롤
      await tester.pump(); // 애니메이션 시작
      await tester.pump(const Duration(seconds: 2)); // 새로고침 대기 시간 시뮬레이션

      // 새로고침 후 새로운 아이템이 렌더링되었는지 확인
      expect(find.byKey(userItemKey), findsOneWidget);
    });

    testWidgets('drag until the scroll ends, get more users', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final listFinder = find.byType(UserListItemWidget);
      expect(listFinder, findsWidgets);

      await tester.pumpAndSettle();

      // 첫 로드시 아이템 개수 확인
      final itemCount = tester.widgetList(listFinder).length;
      expect(itemCount, greaterThan(5));

      await tester.dragUntilVisible(
        find.byKey(const Key('banner:3')), // 마지막 배너가 보일 때까지 스크롤
        find.byType(ListView),
        const Offset(0, -300), // 위로 스크롤
      );

      // 스크롤이 완료될 때까지 대기
      await tester.pumpAndSettle(); // 애니메이션이 끝날 때까지 기다림

      expect(find.byKey(Key('banner:3')), findsOneWidget);
    });

    testWidgets('tap back button on the detail, go back', (tester) async {
      await tester.pumpWidget(const MyApp());
    });
  });
}

class MockUrlLauncherWrapper extends Mock implements UrlLauncherWrapper {}