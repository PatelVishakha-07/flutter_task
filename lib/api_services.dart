import "package:dio/dio.dart";
import "package:products/login/login_model.dart";
import "package:products/register/register_model.dart";
import "package:products/dashboard/dashboard_model.dart";
import "package:products/user/user_model.dart";

class ApiService{

  Dio dio = Dio();

  Future<Login> loginService(String username, password) async{
    try{
      final response = await dio.post("https://dummyjson.com/auth/login",
          data: {
            "username":username,
            "password":password
          });

      if(response.statusCode == 200 || response.statusCode == 201){
        final userData = Login.fromJson(response.data);
        return userData;
      }

      else{
        throw Exception("Error!!!");
      }
    }
    catch(e){
      throw Exception("Invalid username or password");
    }
  }


  Future<Register> registerService(Register user) async{
    try{
      final response = await dio.post("https://dummyjson.com/users/add",
          data:user.toJson()
      );
      return Register.fromJson(response.data);
    }
    catch(e){
      throw Exception(e);
    }
  }

  Future<Product> productService() async {
    try
    {
      final respo = await dio.get("https://dummyjson.com/products");

      if(respo.statusCode == 200)
      {
        final value = Product.fromJson(respo.data);
        return value;
      }
      else
      {
        throw Exception("Error...!");
      }

    }
    catch(e)
    {
      print("Exception--------------$e");
      throw("error",Exception);

    }

  }


  Future<User> userService(int id) async{
    try{
      final response = await dio.get("https://dummyjson.com/users/$id");
      return User.fromJson(response.data);
    }
    on DioException catch(e){
      final message = e.response?.data?['message'] ?? "Something went wrong";
      throw Exception(message);
    }
  }

}