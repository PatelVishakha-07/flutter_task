import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/login/login_controller.dart';
import 'package:products/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue.shade700),
                child: Icon(Icons.lock_outline, size: 50, color: Colors.white,),
              ),

              SizedBox(height: 30,),
              Text("Welcome back", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),

              SizedBox(height: 10,),
              Text("Log in to see your products", style: TextStyle(fontSize: 15),),

              SizedBox(height: 40,),

              Card(
                child: Column(
                  children: [
                    SizedBox(
                      child: TextField(
                        controller: controller.username,
                        decoration: InputDecoration(
                          label: Text("Username",),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                        ),
                      ),
                      width: 350,
                    ),

                    SizedBox(height: 20,),

                    SizedBox(
                      child: TextField(
                        controller: controller.password,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            label: Text("Password",),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(isVisible ? Icons.visibility_sharp : Icons.visibility_off_sharp))
                        ),
                      ),
                      width: 350,
                    ),

                    SizedBox(height: 30,),

                    Obx(() => SizedBox(
                      height: 35,
                      width: 350,
                      child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () => controller.loginController(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700, ),
                          child: controller.isLoading.value
                              ? Center(child: CircularProgressIndicator(),)
                              : Text("Login", style: TextStyle(color: Colors.white))
                      ),
                    )),

                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          child: Text("Sign up",style: TextStyle(color: Colors.blue.shade700)),
                          onPressed: (){
                            Get.to(RegisterScreen());
                          },
                          )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
