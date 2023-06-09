import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/modules/example1/page.dart';
import 'package:riverpod_examples/modules/example2/page.dart';
import 'package:riverpod_examples/modules/example3/page.dart';
import 'package:riverpod_examples/modules/example4/page.dart';
import 'package:riverpod_examples/modules/example5/page.dart';
import 'package:riverpod_examples/modules/example6/page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
      routes: {
        '/example1': (context) => const Example1(),
        '/example2': (context) => const Example2(),
        '/example3': (context) => const Example3(),
        '/example4': (context) => const Example4(),
        '/example5': (context) => const Example5(),
        '/example6': (context) => const Example6(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            final exampleNumber = index + 1;
            return Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/example$exampleNumber');
                  },
                  child: Text('Example$exampleNumber'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
