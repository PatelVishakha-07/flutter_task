import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:products/api_services.dart';
import 'package:products/login/login_controller.dart';
import 'package:products/login/login_screen.dart';
import 'package:products/register/register_model.dart';

class RegisterController extends GetxController{
  ApiService api = ApiService();
  LoginController loginController = LoginController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  
  Future<void> registerController() async{
    if(!formkey.currentState!.validate()) return;

    isLoading.value = true;
    try{
      final response = await api.registerService(Register(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        username: username.text.trim()
      ));

      loginController.showSnackbar("Account created successfully");
      Get.put(LoginScreen());

    }
    catch(e){
      loginController.showSnackbar(e.toString().replaceFirst("Exception: ", ""), error: true);
    }
    finally{
      isLoading.value = false;
    }
  }
}