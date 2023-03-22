import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

import 'credentials.dart';


abstract class SignUpRepository {
  Future<User> signUpWeb({required Credentials credentials});
  Future<User> socialSignUp();
}
