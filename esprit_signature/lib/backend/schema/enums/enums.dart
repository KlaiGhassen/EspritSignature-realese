import 'package:collection/collection.dart';

enum Role {
  ENSEIGNANT,
  ADMIN,
  SUPERADMIN,
}

enum Status {
  LOGIN,
  DONE,
  NOLOG,
  ALL,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    default:
      return null;
  }
}
