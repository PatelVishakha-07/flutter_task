import "package:dio/dio.dart";
import "package:products/login/login_model.dart";
import "package:products/dashboard/dashboard_model.dart";

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
  
  Future<Product> productService() async
  {
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
          print(e);
          throw("error",Exception);

        }
    
  }
  
}