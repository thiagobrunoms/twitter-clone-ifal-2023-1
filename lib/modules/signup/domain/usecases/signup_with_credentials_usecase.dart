
import 'package:twitter_clone_ifal_2023/modules/signup/domain/usecases/signup_usecase.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

import '../entities/credentials.dart';
import '../repositories/signup_repository.dart';

class SignUpWithCredentialsUsecase implements SignUpUsecase {

  SignUpWithCredentialsUsecase({required this.repository});

  SignUpRepository repository;

  @override
  Future<User> call({Credentials? credentials}) async {
    if (credentials != null) {
      return await repository.signUpWeb(credentials: credentials);
    }

    return await repository.socialSignUp();
  }
}