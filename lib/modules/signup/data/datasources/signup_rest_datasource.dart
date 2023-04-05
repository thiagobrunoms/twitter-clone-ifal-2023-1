
import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/signup_web_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/credentials.dart';

class SignUpRestDatasource implements SignUpWebDatasource {

  SignUpRestDatasource({required this.dio});

  Dio dio;

  @override
  Future<User> signInWithWeb({required Credentials credentials}) async {
    var response = await dio.post(
      '/users/add', 
      data: credentials.toMap()
    );

    print('RESPOSTA DO DUMMY JSON ');
    print(response.data);

    User user = User.fromMap(response.data);
    return user;
  }
}