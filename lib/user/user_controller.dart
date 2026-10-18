import 'package:get/get.dart';
import 'package:products/api_services.dart';
import 'package:products/user/user_model.dart';

class UserController extends GetxController{
  final int id;
  UserController(this.id);

  ApiService api = ApiService();
  RxBool isLoading = true.obs;
  final user = Rxn<User>();

  @override
  void onInit(){
    super.onInit();
    userController(id);
  }

  Future<void> userController(int id) async{
    try{
      isLoading.value = true;
      user.value = await api.userService(id);
    }
    catch(e){
      Get.snackbar("Error", e.toString().replaceFirst("Exception: ", ""));
    }
    finally{
      isLoading.value = false;
    }
  }
}