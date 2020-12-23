import 'package:mockito/mockito.dart' as _i1;
import 'testing_test.dart' as _i2;
import 'dart:async' as _i3;

class _UnusableToBeUnusable extends _i1.Unusable implements _i2.ToBeUnusable {
  _UnusableToBeUnusable([Type? _class, Symbol? _method])
      : super(_class, _method);
}

class _UnusableList<E> extends _i1.Unusable implements List<E> {
  _UnusableList([Type? _class, Symbol? _method]) : super(_class, _method);
}

class _UnusableSet<E> extends _i1.Unusable implements Set<E> {
  _UnusableSet([Type? _class, Symbol? _method]) : super(_class, _method);
}

class _UnusableMap<K, V> extends _i1.Unusable implements Map<K, V> {
  _UnusableMap([Type? _class, Symbol? _method]) : super(_class, _method);
}

class _UnusableStream<T> extends _i1.Unusable implements _i3.Stream<T> {
  _UnusableStream([Type? _class, Symbol? _method]) : super(_class, _method);
}

/// A class which mocks [ToBeMocked].
///
/// See the documentation for Mockito's code generation for more information.
class MockToBeMocked extends _i1.Mock implements _i2.ToBeMocked {
  MockToBeMocked() {
    _i1.returnFakeOnMissingStub(this);
  }

  _i2.ToBeUnusable returnUnusable() => (super.noSuchMethod(
          Invocation.method(#returnUnusable, []),
          _UnusableToBeUnusable(_i2.ToBeUnusable, #returnUnusable))
      as _i2.ToBeUnusable);
  _i3.Future<_i2.ToBeUnusable> returnFutureUnusable() => (super.noSuchMethod(
          Invocation.method(#returnFutureUnusable, []),
          Future.value(
              _UnusableToBeUnusable(_i2.ToBeUnusable, #returnFutureUnusable)))
      as _i3.Future<_i2.ToBeUnusable>);
  int returnInt() =>
      (super.noSuchMethod(Invocation.method(#returnInt, []), 0, true) as int);
  _i3.Future<int> returnFutureInt() => (super.noSuchMethod(
          Invocation.method(#returnFutureInt, []), Future.value(0), true)
      as _i3.Future<int>);
  List<_i2.ToBeUnusable> returnList() => (super.noSuchMethod(
          Invocation.method(#returnList, []),
          _UnusableList<_i2.ToBeUnusable>(List, #returnList))
      as List<_i2.ToBeUnusable>);
  Set<_i2.ToBeUnusable> returnSet() => (super.noSuchMethod(
          Invocation.method(#returnSet, []),
          _UnusableSet<_i2.ToBeUnusable>(Set, #returnSet))
      as Set<_i2.ToBeUnusable>);
  Map<String, _i2.ToBeUnusable> returnMap() => (super.noSuchMethod(
          Invocation.method(#returnMap, []),
          _UnusableMap<String, _i2.ToBeUnusable>(Map, #returnMap))
      as Map<String, _i2.ToBeUnusable>);
  double returnDouble() =>
      (super.noSuchMethod(Invocation.method(#returnDouble, []), 0.0, true)
          as double);
  num returnNum() =>
      (super.noSuchMethod(Invocation.method(#returnNum, []), 0, true) as num);
  String returnString() =>
      (super.noSuchMethod(Invocation.method(#returnString, []), '', true)
          as String);
  _i3.Stream<_i2.ToBeUnusable> returnStream() => (super.noSuchMethod(
          Invocation.method(#returnStream, []),
          _UnusableStream<_i2.ToBeUnusable>(_i3.Stream, #returnStream))
      as _i3.Stream<_i2.ToBeUnusable>);
  void Function() returnFunction() =>
      (super.noSuchMethod(Invocation.method(#returnFunction, []), () {}, true)
          as void Function());
  _i3.Future<void Function()> returnFutureFunction() => (super.noSuchMethod(
      Invocation.method(#returnFutureFunction, []),
      Future.value(() {}),
      true) as _i3.Future<void Function()>);
}
