import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:products/api_services.dart';

class LoginController extends GetxController{

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  ApiService api = ApiService();
  RxBool isLoading = false.obs;

  Future<void> loginController() async{
    isLoading.value = true;
    try{
      final response = await api.loginService(username.text, password.text);
      Get.snackbar("Success", "Login Successfull");
    }
    catch(e){
      Get.snackbar("Error", e.toString().replaceFirst("Exception: ", ""));
    }
    finally{
      isLoading.value = false;
    }
  }
}