import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final authProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<bool> {
  AuthNotifier();
  Dio? client;

  @override
  FutureOr<bool> build() async {
    client = ref.watch(dioProvider);

    final result = await client?.get(
      'https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0',
    );
    print(result);

    return Random().nextBool();
  }

  Future<void> signin(String email, String password) async {
    // Mocking signin requests
    state = await AsyncValue.guard(() async {
      final result = await client?.get(
        'https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0',
      );
      print(result);
      return true;
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