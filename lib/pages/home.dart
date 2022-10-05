import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/auth_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routeName = 'home';
  static const routeLocation = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Hello there..'),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).signout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
