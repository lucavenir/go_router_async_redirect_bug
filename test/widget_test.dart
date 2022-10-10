import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router_bugs_repro/example.dart';

void main() {
  group('widget testing', () {
    testWidgets('sync router flow', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: SyncExample()));
      expect(find.text('Splash Page'), findsOneWidget);

      await tester.pumpAndSettle();
      expect(find.text('Home Page'), findsNothing);
      expect(find.text('Splash Page'), findsNothing);
      expect(find.text('Login Page'), findsOneWidget);

      // Tap the login button
      await tester.tap(find.bySemanticsLabel('Login'));
      await tester.pumpAndSettle();

      expect(find.text('Login Page'), findsNothing);
      expect(find.text('Splash Page'), findsNothing);
      expect(find.text('Home Page'), findsOneWidget);

      await tester.tap(find.bySemanticsLabel('Logout'));
      await tester.pumpAndSettle();

      expect(find.text('Splash Page'), findsNothing);
      expect(find.text('Home Page'), findsNothing);
      expect(find.text("Login Page"), findsOneWidget);
    });

    testWidgets('async router flow', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: AsyncExample()));
      expect(find.text('Splash Page'), findsOneWidget); // It fails here

      await tester.pumpAndSettle();
      expect(find.text('Home Page'), findsNothing);
      expect(find.text('Splash Page'), findsNothing);
      expect(find.text('Login Page'), findsOneWidget);

      // Tap the login button
      await tester.tap(find.bySemanticsLabel('Login'));
      await tester.pumpAndSettle();

      expect(find.text('Login Page'), findsNothing);
      expect(find.text('Splash Page'), findsNothing);
      expect(find.text('Home Page'), findsOneWidget);

      await tester.tap(find.bySemanticsLabel('Logout'));
      await tester.pumpAndSettle();

      expect(find.text('Splash Page'), findsNothing);
      expect(find.text('Home Page'), findsNothing);
      expect(find.text("Login Page"), findsOneWidget);
    });
  });
}
