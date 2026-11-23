/// Group the list by a specific key and return the map
/// Parameters:
/// - [items]: list of items to be grouped
/// - [keyOf]: the key attribute to be used to group the list
/// Returns a map of grouped list
Map<K, List<T>> groupBy<T, K>(List<T> items, K Function(T item) keyOf) {
  final groups = <K, List<T>>{};
  for (final item in items) {
    final key = keyOf(item);
    (groups[key] ??= <T>[]).add(item);
  }

  return groups;
}

/// Get an item from list by ID
/// Parameters:
/// - [items]: list of items to be searched
/// - [id]: the ID to be searched
/// - [getId]: a function that takes an item of type [T] and returns its ID as a [String].
/// Returns the item if the item ID matches [id], otherwise null
T? fetchById<T>(List<T> items, String id, String Function(T) getId) {
  for (final item in items) {
    if (getId(item) == id) {
      return item;
    }
  }
  return null;
}
