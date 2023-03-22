import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/models/film.dart';

final mockFileList = [
  const Film(
      id: 1,
      title: 'GHOST IN THE SHELL',
      description:
          '本片設定在2029年的高科技未來，劇情圍繞著女主角草薙素子展開。草薙是全身義體的機械生化人，隸屬公安九課，在執行任務的同時也試著探索自己的存在意義。本片部分畫面結合了當時新興的電腦動畫技術。'),
  const Film(
      id: 2,
      title: 'A Short Film About Killing',
      description:
          'The film compares the senseless, violent murder of an individual to the cold, calculated execution by the state.'),
  const Film(
      id: 3,
      title: 'The Godfather',
      description:
          '《教父》（英语：The Godfather）是一部1972年的美国犯罪电影，根据马里奥·普佐的1969年同名畅销小说改编，弗朗西斯·科波拉执导，由马龙·白兰度和艾尔·帕西诺主演。'),
  const Film(
      id: 4,
      title: 'The Disappearance of Haruhi Suzumiya',
      description:
          '故事发生于文化祭结束后的12月16日，由凉宫春日领导的SOS团决定将在圣诞节举行火锅派对。然而，12月18日阿虚到学校发现，所有的一切发生了巨大的变化。春日以及古泉所在的1年9班完全消失，朝比奈学姐认不出他，朝仓凉子突然出现，长门有希也变成了普通人。没有人知道有关春日和SOS团的任何信息。'),
];

class FilmsNotifier extends StateNotifier<List<Film>> {
  FilmsNotifier() : super(mockFileList);

  void toggleFavorite(id) {
    state = state.map((item) {
      if (item.id == id) {
        return item.copyWith(isFavorite: !item.isFavorite);
      }
      return item;
    }).toList();
  }
}

final filmsProvider =
    StateNotifierProvider<FilmsNotifier, List<Film>>((ref) => FilmsNotifier());

enum FavoriteStatus {
  all,
  favorite,
  unfavorite,
}

final favoriteStatusProvider = StateProvider((ref) => FavoriteStatus.all);

// it's like a computed state.
final visibleFilmsProvider = Provider((ref) {
  final films = ref.watch(filmsProvider);
  final favoriteStatus = ref.watch(favoriteStatusProvider);
  return films.where((element) {
    if (favoriteStatus == FavoriteStatus.favorite) {
      return element.isFavorite == true;
    }
    if (favoriteStatus == FavoriteStatus.unfavorite) {
      return element.isFavorite == false;
    }
    return true;
  }).toList();
});

/// It's a film list with a favorite filter, user can toggle favorite and filter by favorite status.
/// StateNotifierProvider is used for immutable state, that's why we using copywith for state update.
/// Also we create a "computed state" here, which is very useful.
class Example6 extends ConsumerWidget {
  const Example6({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteStatus = ref.watch(favoriteStatusProvider);
    final visibleFilms = ref.watch(visibleFilmsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example6'),
      ),
      body: Column(
        children: [
          DropdownButton(
            items: FavoriteStatus.values
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item.toString().split('.').last),
                    ))
                .toList(),
            onChanged: (status) {
              ref.read(favoriteStatusProvider.notifier).state = status!;
            },
            value: favoriteStatus,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: visibleFilms.length,
              itemBuilder: (context, index) {
                final film = visibleFilms[index];
                final favoriteIcon = film.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border);
                return ListTile(
                  title: Text(film.title),
                  subtitle: Text(film.description),
                  trailing: IconButton(
                    icon: favoriteIcon,
                    onPressed: () {
                      ref.read(filmsProvider.notifier).toggleFavorite(film.id);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
