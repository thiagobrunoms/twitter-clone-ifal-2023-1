
import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/signup_web_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/credentials.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

class SignUpSOAPDatasource implements SignUpWebDatasource {
  
  @override
  Future<User> signInWithWeb({required Credentials credentials}) {
    // TODO: implement signInWithWeb
    throw UnimplementedError();
  }
  
}