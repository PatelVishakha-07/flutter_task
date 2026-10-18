// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/dashboard/dashboard_controller.dart';
import 'package:products/product/product_controller.dart';

class ProductDetails extends StatefulWidget {
   ProductDetails({super.key, required this.id});

  final int id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late final ProductDetailsController controller;
 @override
  void initState() {

    super.initState();
    controller = Get.put(ProductDetailsController(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
        appBar: AppBar(
          title: const Text('Product Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),

      body: Obx((){
        if(controller.isLoading.value)
          {
            return Center(child: CircularProgressIndicator());
          }

        final data = controller.ProductData.value;

        if (data == null) {
          return const Center(
            child: Text("Product not found"),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                height: 280,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Image.network(
                  data.thumbnail ?? '',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 85,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE4FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      data.category ?? 'General',
                      style:  TextStyle(
                        color: Color(0xFF6750A4),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Product Id: ${data.id}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),


              Text(
                data.title ?? 'Product name unavailable',
                style:  TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25243A),
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 18),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:  Color(0xFF25243A),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:  Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Product value',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '₹. ${data.price ?? 0}',
                      style:  TextStyle(
                        color: Color(0xFFB9A5FF),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Description heading
              const Text(
                'About this product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25243A),
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color:  Color(0xFFE9E8EF),
                  ),
                ),
                child: Text(
                  data.description ?? 'No description available.',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.8,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}