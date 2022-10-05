import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_range_error/state/auth_state.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static const routeName = 'login';
  static const routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).signin("email", "password");
              },
              child: const Text('Login'))),
    );
  }
}
