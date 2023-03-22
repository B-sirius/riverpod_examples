import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider((ref) {
  return 0;
});

/// It shows a counter.
/// A StateProvider holds a state, and we can change the state with update .state directly.
/// Or we can use update method like .update((state) => state +1), so it can read its previous value.
class Example2 extends ConsumerWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Example2')),
      body: Center(
        child: Column(
          children: [
            Text(count.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(countProvider.notifier).state = count + 1;
              },
              child: const Text('add'),
            )
          ],
        ),
      ),
    );
  }
}
