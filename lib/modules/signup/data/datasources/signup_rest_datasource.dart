
import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/signup_web_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/credentials.dart';

class SignUpRestDatasource implements SignUpWebDatasource {

  SignUpRestDatasource();

  // Dio dio;

  @override
  Future<User> signInWithWeb({required Credentials credentials}) async {
    Dio dio = Dio();

    var response = await dio.post(
      'http://10.0.2.2:3000/signup', 
      data: credentials.toMap()
    );

    User user = User.fromMap(response.data);
    return user;
  }
}