// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'film.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Film {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilmCopyWith<Film> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmCopyWith<$Res> {
  factory $FilmCopyWith(Film value, $Res Function(Film) then) =
      _$FilmCopyWithImpl<$Res, Film>;
  @useResult
  $Res call({int id, String title, String description, bool isFavorite});
}

/// @nodoc
class _$FilmCopyWithImpl<$Res, $Val extends Film>
    implements $FilmCopyWith<$Res> {
  _$FilmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilmCopyWith<$Res> implements $FilmCopyWith<$Res> {
  factory _$$_FilmCopyWith(_$_Film value, $Res Function(_$_Film) then) =
      __$$_FilmCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String description, bool isFavorite});
}

/// @nodoc
class __$$_FilmCopyWithImpl<$Res> extends _$FilmCopyWithImpl<$Res, _$_Film>
    implements _$$_FilmCopyWith<$Res> {
  __$$_FilmCopyWithImpl(_$_Film _value, $Res Function(_$_Film) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? isFavorite = null,
  }) {
    return _then(_$_Film(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Film implements _Film {
  const _$_Film(
      {required this.id,
      required this.title,
      required this.description,
      this.isFavorite = false});

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'Film(id: $id, title: $title, description: $description, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Film &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilmCopyWith<_$_Film> get copyWith =>
      __$$_FilmCopyWithImpl<_$_Film>(this, _$identity);
}

abstract class _Film implements Film {
  const factory _Film(
      {required final int id,
      required final String title,
      required final String description,
      final bool isFavorite}) = _$_Film;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_FilmCopyWith<_$_Film> get copyWith => throw _privateConstructorUsedError;
}
