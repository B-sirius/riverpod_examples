import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/models/person.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();

class PersonNotifier extends ChangeNotifier {
  final list = <Person>[];

  void add(person) {
    list.add(person);
    notifyListeners();
  }

  void update(int index, Person person) {
    list[index].name = person.name;
    list[index].age = person.age;
    notifyListeners();
  }
}

final personProvider = ChangeNotifierProvider<PersonNotifier>((ref) {
  return PersonNotifier();
});

Future<Person?> createOrUpdatePersonDialog(
  BuildContext context,
  Person? existingPerson,
) {
  String? name = existingPerson?.name;
  int? age = existingPerson?.age;

  nameController.text = name ?? '';
  ageController.text = age?.toString() ?? '';

  final formKey = GlobalKey<FormState>();

  return showDialog<Person?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Create a person'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name: ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age: ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState != null &&
                  formKey.currentState!.validate()) {
                Navigator.of(context).pop(Person(
                  name: nameController.text,
                  age: int.parse(ageController.text),
                ));
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

/// In this example we create a person list.
/// We can add person or edit existing person.
/// ChangeNotifierProvider is acceptable here because we want the state to be mutable.
class Example5 extends ConsumerWidget {
  const Example5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personList = ref.watch(personProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example5'),
      ),
      body: ListView.builder(
        itemCount: personList.list.length,
        itemBuilder: (context, index) {
          final person = personList.list[index];
          return GestureDetector(
            child: ListTile(
              title:
                  Text('${person.name} (${person.age.toString()} years old)'),
            ),
            onTap: () async {
              final updatedPerson =
                  await createOrUpdatePersonDialog(context, person);
              if (updatedPerson != null) {
                ref.read(personProvider.notifier).update(index, updatedPerson);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPerson = await createOrUpdatePersonDialog(context, null);
          ref.read(personProvider.notifier).add(newPerson);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
