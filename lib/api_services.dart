import "package:dio/dio.dart";
import "package:products/login/login_model.dart";

class ApiService{

  Dio dio = Dio();

  Future<User> loginService(String username, password) async{
      try{
        final response = await dio.post("https://dummyjson.com/auth/login",
        data: {
          "email":username,
          "password":password
        });

        if(response.statusCode == 200 || response.statusCode == 201){
          final userData = User.fromJson(response.data);
          return userData;
        }
        else{
          throw Exception("Error!!!");
        }
      }
      catch(e){
        throw Exception(e);
      }
  }
}