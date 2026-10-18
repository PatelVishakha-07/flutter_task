import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/dashboard/dashboard_controller.dart';
import 'package:products/product/productDetails_screen.dart';

class ProductsList extends StatefulWidget {
   ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  ProductController controller = Get.put(ProductController());
  void initState()
  {
    super.initState();
    controller.ProductCont();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Product's List"),

      ),


      body: Obx(()=> controller.isLoading.value
          ? CircularProgressIndicator()
          : RefreshIndicator(
          onRefresh: () async{
            await controller.ProductCont();
          },
          child:  ListView.builder(
            itemCount: controller.ProductData.length,
            itemBuilder: (context,index){
              final data = controller.ProductData[index];
              return InkWell(
                onTap: (){
                  if(data.id != null)
                    {
                      Get.to(ProductDetails(id: data.id!));
                    }
                  else
                    {
                      Get.snackbar("Error:", "Product id is missing...!");
                    }

                },
                child: Card(
                  child: ListTile(
                      leading: Image.network(
                            data.images != null && data.images!.isNotEmpty
                            ? data.images![0]
                            : data.thumbnail??'https://via.placeholder.com/50',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    title: Text(data.title.toString()),
                    subtitle: Text(data.category.toString()),

                  ),
                ),
              );

            },

          )))


      
    );
  }
}
