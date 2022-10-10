import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<bool> {
  AuthNotifier();

  @override
  FutureOr<bool> build() async {
    // Initially, we are logged out.
    return false;
  }

  Future<void> signin(String email, String password) async {
    // Mocking signin requests
    state = await AsyncValue.guard(() async {
      return Future.delayed(
        const Duration(milliseconds: 50),
        () => true,
      );
    });
  }

  Future<void> signout() async {
    // Mocking signout requests
    state = const AsyncValue.data(false);
  }

  bool get isAuthenticated => state.asData?.value ?? false;
  bool get isLoading => state.isLoading;
}
