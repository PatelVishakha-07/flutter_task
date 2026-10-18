import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:products/api_services.dart';
import 'package:products/dashboard/dashboard_model.dart';

class ProductController extends GetxController
{
  ApiService api = ApiService();

  RxList<Products> ProductData = <Products>[].obs;
  RxBool isLoading = false.obs;
  Future<void> ProductCont() async
  {
    final respo =await api.productService();

    if(respo.products == null || respo.products!.isEmpty)
      {
        Get.snackbar("Error", "Please entre again later",
        backgroundColor: Colors.red,
        );
        isLoading.value = false;
      }
    else
      {
        ProductData.value = respo.products ?? [];
        isLoading.value = false;

      }
  }
}