import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'example.dart';

// Choose your example by commenting / uncommenting the right line below
void main() {
  // runApp(const ProviderScope(child: SyncExample()));
  runApp(const ProviderScope(child: AsyncExample()));
}
