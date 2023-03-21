import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum City { xiamen, shanghai, guangzhou, beijing }

Future<String> getWeather(City city) {
  final map = {
    City.xiamen: '🌧️',
    City.shanghai: '🌞',
    City.guangzhou: '🔥',
    City.beijing: '🌩'
  };
  return Future.delayed(
    const Duration(seconds: 1),
    () => map[city]!,
  );
}

final currentCityProvider = StateProvider<City?>((ref) => null);

final currentWeatherProvider = FutureProvider((ref) {
  final currentCity = ref.watch(currentCityProvider);
  if (currentCity != null) {
    return getWeather(currentCity);
  }
  return 'Select city';
});

// It shows the weather based on the selected city.
// A FutureProvider is like a Provider but for async.
class Example4 extends ConsumerWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example4'),
      ),
      body: Column(
        children: [
          currentWeather.when(
            data: (data) => Text(data.toString()),
            error: (err, stack) => const Text('Error 🫥'),
            loading: () => const Text('Loading...'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: City.values.length,
              itemBuilder: (context, index) {
                final city = City.values[index];
                final isSelected = city == ref.watch(currentCityProvider);
                return ListTile(
                  title: Text(city.toString()),
                  trailing: isSelected ? const Icon(Icons.check) : null,
                  onTap: () {
                    ref.read(currentCityProvider.notifier).state = city;
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
