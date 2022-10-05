import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_range_error/state/auth_state.dart';

import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/splash.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = _RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router._routes,
    redirect: router._redirectLogic,
    initialLocation: '/${SplashPage.routeName}',
  );
});

class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(this.ref) {
    final unsub = ref.listen(authProvider, (_, __) {
      notifyListeners();
    });
    ref.onDispose(unsub.close);
  }
  final Ref ref;

  FutureOr<String?> _redirectLogic(
    BuildContext context,
    GoRouterState state,
    // Try removing this `async` keyword, that out-of-range error will disappear!
  ) async {
    final isLoading = ref.read(authProvider.notifier).isLoading;
    if (isLoading) return null;

    final isAuth = ref.read(authProvider.notifier).isAuthenticated;

    final isSplash = state.location == SplashPage.routeLocation;
    if (isSplash) {
      return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
    }

    final isLoggingIn = state.location == LoginPage.routeLocation;
    if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

    return isAuth ? null : LoginPage.routeLocation;
  }

  /// List and definitions of this app's routes.
  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashPage.routeLocation,
          name: SplashPage.routeName,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: HomePage.routeLocation,
          name: HomePage.routeName,
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: LoginPage.routeLocation,
          name: LoginPage.routeName,
          builder: (context, state) {
            return const LoginPage();
          },
        ),
      ];
}
