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

/// It shows a counter.
/// a state notifier provider is very helpful for it's keeping the state changes methods inside the provider.
class Example3 extends ConsumerWidget {
  const Example3({super.key});

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
