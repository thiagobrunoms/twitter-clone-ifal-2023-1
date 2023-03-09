// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterController on _CounterControllerBase, Store {
  Computed<int>? _$doubleCounterComputed;

  @override
  int get doubleCounter =>
      (_$doubleCounterComputed ??= Computed<int>(() => super.doubleCounter,
              name: '_CounterControllerBase.doubleCounter'))
          .value;
  Computed<int>? _$counterTimesCounter2Computed;

  @override
  int get counterTimesCounter2 => (_$counterTimesCounter2Computed ??=
          Computed<int>(() => super.counterTimesCounter2,
              name: '_CounterControllerBase.counterTimesCounter2'))
      .value;
  Computed<bool>? _$isOddComputed;

  @override
  bool get isOdd => (_$isOddComputed ??= Computed<bool>(() => super.isOdd,
          name: '_CounterControllerBase.isOdd'))
      .value;
  Computed<bool>? _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??= Computed<bool>(() => super.isEven,
          name: '_CounterControllerBase.isEven'))
      .value;

  late final _$counterAtom =
      Atom(name: '_CounterControllerBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$counter2Atom =
      Atom(name: '_CounterControllerBase.counter2', context: context);

  @override
  int get counter2 {
    _$counter2Atom.reportRead();
    return super.counter2;
  }

  @override
  set counter2(int value) {
    _$counter2Atom.reportWrite(value, super.counter2, () {
      super.counter2 = value;
    });
  }

  late final _$counterListObsercableAtom = Atom(
      name: '_CounterControllerBase.counterListObsercable', context: context);

  @override
  ObservableList<int> get counterListObsercable {
    _$counterListObsercableAtom.reportRead();
    return super.counterListObsercable;
  }

  @override
  set counterListObsercable(ObservableList<int> value) {
    _$counterListObsercableAtom.reportWrite(value, super.counterListObsercable,
        () {
      super.counterListObsercable = value;
    });
  }

  late final _$myMapAtom =
      Atom(name: '_CounterControllerBase.myMap', context: context);

  @override
  ObservableMap<String, dynamic> get myMap {
    _$myMapAtom.reportRead();
    return super.myMap;
  }

  @override
  set myMap(ObservableMap<String, dynamic> value) {
    _$myMapAtom.reportWrite(value, super.myMap, () {
      super.myMap = value;
    });
  }

  late final _$_CounterControllerBaseActionController =
      ActionController(name: '_CounterControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction(
        name: '_CounterControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment2() {
    final _$actionInfo = _$_CounterControllerBaseActionController.startAction(
        name: '_CounterControllerBase.increment2');
    try {
      return super.increment2();
    } finally {
      _$_CounterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
counter2: ${counter2},
counterListObsercable: ${counterListObsercable},
myMap: ${myMap},
doubleCounter: ${doubleCounter},
counterTimesCounter2: ${counterTimesCounter2},
isOdd: ${isOdd},
isEven: ${isEven}
    ''';
  }
}
