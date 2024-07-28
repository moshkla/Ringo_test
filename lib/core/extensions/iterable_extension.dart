import 'dart:math';

extension IterableExtention<T> on Iterable<T>? {
  T randomItem() {
    Random random = Random();
    int randomIndex = random.nextInt(this!.length);
    return this!.elementAt(randomIndex);
  }

  bool isEmptyOrNull() {
    return this == null || this!.isEmpty;
  }

  int indexWhereOrZero(bool Function(T) where) {
    final int index = this!.toList().indexWhere(where);
    return index == -1 ? 0 : index;
  }
}
