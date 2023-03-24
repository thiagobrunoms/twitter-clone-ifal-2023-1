import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

import '../../domain/entities/credentials.dart';

abstract class SignUpWebDatasource {
  Future<User> signInWithWeb({required Credentials credentials});
}