import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/login/login_screen.dart';
import 'package:products/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue.shade700),
                    child: Icon(Icons.person_add_alt_outlined, size: 50, color: Colors.white,),
                  ),

                  SizedBox(height: 30,),
                  Text("Create account", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Sign up to see your products"),

                  SizedBox(height: 30,),
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: controller.firstName,
                                  validator: (v) => v!.trim().isEmpty ? "Required" : null,
                                  decoration: fieldDecoration("First Name")
                                ),
                              ),

                              SizedBox(width: 12,),
                              Expanded(
                                child: TextFormField(
                                    controller: controller.lastName,
                                    validator: (v) => v!.trim().isEmpty ? "Required" : null,
                                    decoration: fieldDecoration("Last Name")
                                ),
                              ),
                            ],
                          ),
                          width: 350,
                        ),

                        SizedBox(height: 30,),

                        SizedBox(
                          width: 350,
                          child: TextFormField(
                              controller: controller.username,
                              validator: (v) => v!.trim().isEmpty ? "Required" : null,
                              decoration: fieldDecoration("Username")
                          ),
                        ),

                        SizedBox(height: 20,),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                              controller: controller.email,
                              validator: (v) => v!.trim().isEmpty ? "Required" : null,
                              decoration: fieldDecoration("Email")
                          ),
                        ),

                        SizedBox(height: 20,),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: controller.isPasswordVisible.value,
                              controller: controller.password,
                              validator: (v) => v!.trim().isEmpty ? "Required" : null,
                              decoration: fieldDecoration("Password",
                                  suffix: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                        });
                                      },
                                      icon: Icon(controller.isPasswordVisible.value
                                          ? Icons.visibility_off_sharp : Icons.visibility_sharp))
                              )
                          ),
                        ),

                        SizedBox(height: 20,),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: controller.isConfirmPasswordVisible.value,
                              controller: controller.confirm_password,
                              validator: (v) => v!.trim().isEmpty ? "Required" : null,
                              decoration: fieldDecoration("Confirm Password",
                                  suffix: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          controller.isConfirmPasswordVisible.value = !controller.isConfirmPasswordVisible.value;
                                        });
                                      },
                                      icon: Icon(controller.isConfirmPasswordVisible.value
                                          ? Icons.visibility_off_sharp : Icons.visibility_sharp))
                              ),
                          ),
                        ),

                        SizedBox(height: 30,),
                        Obx(() => SizedBox(
                            height: 40,
                            width: 350,
                            child: ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () => controller.registerController(),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
                                child: controller.isLoading.value
                                ? Center(child: CircularProgressIndicator(),)
                                : Text("Register", style: TextStyle(color: Colors.white),)),
                          ),
                        ),

                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                                onPressed: (){
                                  Get.to(LoginScreen());
                                },
                                child: Text("Login"))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration fieldDecoration(String label, {Widget? suffix}) => InputDecoration(
    label: Text(label),
    suffixIcon: suffix,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red)),
  );
}


