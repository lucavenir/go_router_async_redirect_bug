import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router_range_error/app.dart';

void main() {
  group('widget testing', () {
    testWidgets('startup with a loading screen', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: App()),
      );

      await tester.pumpAndSettle();

      expect(find.text('Loading...'), findsOneWidget);
    });
    testWidgets('startup redirects to login when signed out', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Loading...'), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
    });
  });
}
