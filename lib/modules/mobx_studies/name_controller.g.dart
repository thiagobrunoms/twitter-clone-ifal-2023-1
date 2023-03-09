// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NameController on _NameControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_NameControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$_NameControllerBaseActionController =
      ActionController(name: '_NameControllerBase', context: context);

  @override
  void updateName(String name) {
    final _$actionInfo = _$_NameControllerBaseActionController.startAction(
        name: '_NameControllerBase.updateName');
    try {
      return super.updateName(name);
    } finally {
      _$_NameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
