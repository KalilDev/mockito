/// A stand-in for another object which cannot be used and needs to be discarded.
///
/// A unused has a default behavior for every field and method of throwing
/// [UnusableUsedError]. Fields and methods should not be implemented or
/// overriden, as this class represents values that need to be discarded!
///
/// **WARNING**: [Unusable] uses [noSuchMethod](goo.gl/r3IQUH), which is a _form_ of
/// runtime reflection, and causes sub-standard code to be generated. As such,
/// [Unusable] should strictly _not_ be used in any production code, especially if
/// used within the context of Dart for Web (dart2js, DDC) and Dart for Mobile
/// (Flutter).
abstract class Unusable {
  Unusable([this._class, this._source]);
  final Type? _class;
  final Symbol? _source;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnusableUsedError._(this, invocation);
  }

  @override
  int get hashCode => noSuchMethod(Invocation.getter(#hashCode)) as Never;

  @override
  String toString() => noSuchMethod(Invocation.method(#toString, [])) as Never;

  @override
  Type get runtimeType =>
      noSuchMethod(Invocation.getter(#runtimeType)) as Never;

  @override
  bool operator ==(Object other) =>
      noSuchMethod(Invocation.method(#==, [other])) as Never;
}

String _symbolToString(Symbol s) => s.toString().split('"')[1];

class UnusableUsedError extends Error {
  final Unusable _v;
  final Invocation _i;

  UnusableUsedError._(this._v, this._i);

  @override
  String toString() {
    var result = 'UnusableUsedError: An Unusable value was used.\n';
    result +=
        'Unusable values are meant to be discarded or to be used internally in '
        'mockito, therefore using them is invalid.\n\n';
    final invocationType = _i.isGetter
        ? 'getter'
        : _i.isSetter
            ? 'setter'
            : 'method';
    result +=
        "The $invocationType named '${_symbolToString(_i.memberName)}' was called on a Unusable value\n";
    if (_v._class != null || _v._source != null) {
      result += 'This Unusable value originated from';
      if (_v._source != null) {
        result +=
            " calling the $invocationType '${_symbolToString(_v._source!)}'";
      }
      if (_v._class != null) {
        result += " in the class '${_v._class}'";
      }
      result += '\n';
    } else {
      result +=
          'The Class and method/accessor name were not set in the Unusable constructor.\n';
      result +=
          'In order to get more info about the origin of this Unusable value, '
          'specify them in the Unusable constructor.\n';
    }
    result += '\n';
    result +=
        'In order to fix this you should either discard the returned Unusable '
        'values or stub the $invocationType that generated this Unusable value '
        'to provide an Mock or an real value.';
    return result;
  }
}
