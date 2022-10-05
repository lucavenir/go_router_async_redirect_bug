import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<bool> {
  AuthNotifier();

  @override
  FutureOr<bool> build() async {
    final mockedSigninResult = await Future.delayed(
      const Duration(seconds: 1),
      // This mocks an initial signin request coming from a saved token
      () => Random().nextBool(),
    );

    return mockedSigninResult;
  }

  Future<void> signin(String email, String password) async {
    // Mocking signin requests
    state = await AsyncValue.guard(() async {
      return Future.delayed(
        Duration(milliseconds: Random().nextInt(750)),
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


// final urlPrefixProvider = StateProvider<String>((ref) {
//   var initialState = '';
//   ref.onCancel(() {
//     initialState = '';
//   });

//   return initialState;
// });