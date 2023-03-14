import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = Provider((_) => DateTime.now());

/// A simple provider, only watch, no operations.
class Example1 extends ConsumerWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Example1')),
      body: Center(
        child: Text(date.toString()),
      ),
    );
  }
}
