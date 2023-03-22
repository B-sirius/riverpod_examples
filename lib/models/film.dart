import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';

@freezed
class Film with _$Film {
  const factory Film({
    required final int id,
    required final String title,
    required final String description,
    @Default(false) final bool isFavorite,
  }) = _Film;
}
