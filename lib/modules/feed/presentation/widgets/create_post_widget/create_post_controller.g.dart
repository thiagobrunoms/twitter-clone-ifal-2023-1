// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePostController on _CreatePostControllerBase, Store {
  late final _$bodyAtom =
      Atom(name: '_CreatePostControllerBase.body', context: context);

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  late final _$sendNewPostRequestAtom = Atom(
      name: '_CreatePostControllerBase.sendNewPostRequest', context: context);

  @override
  ObservableFuture<bool>? get sendNewPostRequest {
    _$sendNewPostRequestAtom.reportRead();
    return super.sendNewPostRequest;
  }

  @override
  set sendNewPostRequest(ObservableFuture<bool>? value) {
    _$sendNewPostRequestAtom.reportWrite(value, super.sendNewPostRequest, () {
      super.sendNewPostRequest = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_CreatePostControllerBase.result', context: context);

  @override
  bool get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(bool value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$sendPostAsyncAction =
      AsyncAction('_CreatePostControllerBase.sendPost', context: context);

  @override
  Future<void> sendPost() {
    return _$sendPostAsyncAction.run(() => super.sendPost());
  }

  late final _$_CreatePostControllerBaseActionController =
      ActionController(name: '_CreatePostControllerBase', context: context);

  @override
  void setBody(String text) {
    final _$actionInfo = _$_CreatePostControllerBaseActionController
        .startAction(name: '_CreatePostControllerBase.setBody');
    try {
      return super.setBody(text);
    } finally {
      _$_CreatePostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
body: ${body},
sendNewPostRequest: ${sendNewPostRequest},
result: ${result}
    ''';
  }
}
