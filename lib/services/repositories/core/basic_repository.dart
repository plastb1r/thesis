import 'dart:async';
import 'dart:core';

abstract class BasicRepository<T> {
  Future<List<T>> load();

  Future save(List<T> entities);
}
