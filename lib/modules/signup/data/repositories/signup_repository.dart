

import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/signup_web_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';
import '../../domain/entities/credentials.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_social_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  SignUpRepositoryImpl({required this.webDatasource, required this.socialDatasource});

  final SignUpSocialDatasource socialDatasource; //Apple, Google, Facebook...
  final SignUpWebDatasource webDatasource; //REST, SOAP, GRAPHQL

  @override
  Future<User> signUpWeb({required Credentials credentials}) async {
    return await webDatasource.signInWithWeb(credentials: credentials);
  }

  @override
  Future<User> socialSignUp() async {
    return await socialDatasource.signUp();
  }
}