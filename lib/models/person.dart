import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@unfreezed
class Person with _$Person {
  factory Person({
    required String name,
    required int age,
  }) = _Person;
}
