import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});
  static const routeName = 'splash';
  static const routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
