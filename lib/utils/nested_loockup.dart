// ignore: non_constant_identifier_names
nested_lookup(dynamic source, dynamic indexes) {
  if (indexes.length == 1) {
    return source[indexes[0]];
  }
  return nested_lookup(source[indexes[0]], indexes.sublist(1));
}
