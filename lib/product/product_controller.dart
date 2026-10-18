import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/api_services.dart';
import 'package:products/dashboard/dashboard_model.dart';

class ProductDetailsController extends GetxController{
  ApiService api = ApiService();
  final int  id;

  ProductDetailsController(this.id);

  Rxn<Products> ProductData = Rxn<Products>();
  RxBool isLoading = true.obs;

  Future<void> ProductDetailsCont() async{

    try{

      isLoading.value = true;
      final respo = await api.productService();

      if(respo.products == null || respo.products !.isEmpty)
      {
        Get.snackbar("Error:", "Something went wrong",
          backgroundColor: Colors.red,);
        return;
      }
      else
      {
        final selectedProduct = respo.products!.firstWhereOrNull((element) => element.id == id);

        if(selectedProduct == null)
        {
          Get.snackbar("Error", "Product not found");
        }
        else{
          ProductData.value = selectedProduct;
        }

      }
    }
    catch(e)
    {
      print(e);
      Get.snackbar("Error:", "something went wrong");
    }
    finally
        {
          isLoading.value = false;
        }
  }
  @override
  void onInit() {
    super.onInit();
    ProductDetailsCont();
  }
}