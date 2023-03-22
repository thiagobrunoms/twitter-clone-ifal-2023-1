import 'package:twitter_clone_ifal_2023/modules/signup/domain/credentials.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

abstract class SignUpWebDatasource {

  Future<User> signInWithWeb({required Credentials credentials});

}