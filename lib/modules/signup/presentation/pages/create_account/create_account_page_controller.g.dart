// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAccountPageController on _CreateAccountPageControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_CreateAccountPageControllerBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$createAccountObservableFutureAtom = Atom(
      name: '_CreateAccountPageControllerBase.createAccountObservableFuture',
      context: context);

  @override
  ObservableFuture<User>? get createAccountObservableFuture {
    _$createAccountObservableFutureAtom.reportRead();
    return super.createAccountObservableFuture;
  }

  @override
  set createAccountObservableFuture(ObservableFuture<User>? value) {
    _$createAccountObservableFutureAtom
        .reportWrite(value, super.createAccountObservableFuture, () {
      super.createAccountObservableFuture = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
createAccountObservableFuture: ${createAccountObservableFuture}
    ''';
  }
}
