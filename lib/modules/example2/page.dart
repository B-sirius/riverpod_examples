import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateNotifierProvider((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  void increment() {
    state = state + 1;
  }
}

/// A simple provider, only watch, no operations.
class Example2 extends ConsumerWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Example1')),
      body: Center(
        child: Column(
          children: [
            Text(count.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(countProvider.notifier).increment();
              },
              child: const Text('add'),
            )
          ],
        ),
      ),
    );
  }
}
