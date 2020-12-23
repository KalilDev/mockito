import 'package:matcher/matcher.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'testing_test.mocks.dart';

abstract class ToBeUnusable {
  void run();
  int returnInt();
  Future<bool> returnFutureBool();
}

abstract class ToBeMocked {
  ToBeUnusable returnUnusable();
  Future<ToBeUnusable> returnFutureUnusable();
  int returnInt();
  Future<int> returnFutureInt();
  List<ToBeUnusable> returnList();
  Set<ToBeUnusable> returnSet();
  Map<String, ToBeUnusable> returnMap();
  double returnDouble();
  num returnNum();
  String returnString();
  Stream<ToBeUnusable> returnStream();
  void Function() returnFunction();
  Future<void Function()> returnFutureFunction();
}

@GenerateMocks([ToBeMocked])
void main() {
  late ToBeMocked mocked;
  setUp(() => mocked = MockToBeMocked());
  test('Object properties are not stubbed', () {
    expect(mocked.hashCode, isA<int>());
    expect(mocked == mocked, true);
    expect(mocked.runtimeType, isA<Type>());
    expect(mocked.toString(), isA<String>());
  });
  test('Methods that return primitives throw by default', () async {
    expect(mocked.returnInt, throwsA(anything));
    await expectLater(mocked.returnFutureInt, throwsA(anything));
    expect(mocked.returnDouble, throwsA(anything));
    expect(mocked.returnNum, throwsA(anything));
    expect(mocked.returnString, throwsA(anything));
  });
  test('Function types are also working and throws by default', () {
    expect(mocked.returnFunction, throwsA(anything));
    expect(mocked.returnFutureFunction, throwsA(anything));
  });
  test('Methods that do not return primitives work without stubbing', () async {
    expect(mocked.returnUnusable, returnsNormally);
    await expectLater(mocked.returnFutureUnusable(), completes);
    expect(mocked.returnList, returnsNormally);
    expect(mocked.returnSet, returnsNormally);
    expect(mocked.returnMap, returnsNormally);
    expect(mocked.returnStream, returnsNormally);
  });
  test('Unusable values are unusable', () {
    final unusable = mocked.returnUnusable();
    expect(() => unusable.run(), throwsA(anything));
    expect(() => unusable.returnInt(), throwsA(anything));
    expect(() => unusable.returnFutureBool(), throwsA(anything));
  });
  test('Unusable error message contains the information added on codegen', () {
    final unusable = mocked.returnUnusable();
    expect(_errorMessage(unusable.run), contains('run'));
    expect(_errorMessage(unusable.run), contains('ToBeUnusable'));
    expect(_errorMessage(unusable.run), contains('returnUnusable'));
    expect(_errorMessage(unusable.returnInt), contains('returnInt'));
    expect(_errorMessage(unusable.returnInt), contains('ToBeUnusable'));
    expect(_errorMessage(unusable.returnInt), contains('returnUnusable'));
  });
}

String _errorMessage(void Function() fn) {
  try {
    fn();
  } catch (e) {
    return e.toString();
  }
  fail('The callback should have thrown');
}
