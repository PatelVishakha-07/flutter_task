import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/api_services.dart';
import 'package:products/dashboard/dashboard_screen.dart';

class LoginController extends GetxController{

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  ApiService api = ApiService();
  RxBool isLoading = false.obs;

  Future<void> loginController() async{
    if (username.text.trim().isEmpty || password.text.isEmpty) {
      showSnackbar("Please enter username and password", error: true);
      return;
    }

    isLoading.value = true;
    try{
      final response = await api.loginService(username.text, password.text);

      showSnackbar("Login successful");
    }
    catch(e){
      showSnackbar(e.toString().replaceFirst("Exception: ", ""), error: true);
    }
    finally{
      isLoading.value = false;
    }
  }

  void showSnackbar(String msg, {bool error = false}){
    Get.showSnackbar(
      GetSnackBar(
        message: msg,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: error ? Colors.red.shade700 : Colors.green.shade700,
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        icon: Icon(error ? Icons.error_outline : Icons.check_circle_outline, color: Colors.white,),
      )
    );
  }

}