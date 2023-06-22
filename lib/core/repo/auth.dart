import 'package:authapp/config.dart';
import 'package:authapp/core/models/user.dart';
import 'package:dio/dio.dart';

Future<UserModel> login(String email,String password)async{
  try {
    Response response = await Dio().post(
      "${APIConfig.baseUrl}/login",
      data: {
        "username":email,
        "password":password
      }
    );
    return UserModel.fromJson(email,response.data);
  }catch(e){
    if( e is DioException){
      print(e.response!.data);
    }
    return Future.error(e);
  }
}