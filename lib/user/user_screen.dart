import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products/user/user_controller.dart';

class UserScreen extends StatefulWidget {
  final int id;
  UserScreen({super.key, required this.id});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final UserController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(UserController(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final u = controller.user.value;
        if (u == null) {
          return Center(child: Text("No data"));
        }

        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 50, backgroundImage: u.image != null ? NetworkImage(u.image!) : null,),
                SizedBox(height: 30),

                Text("${u.firstName} ${u.lastName}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 30),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userInfo(u.email.toString(), Icons.email_outlined),
                        SizedBox(height: 20),

                        userInfo(u.phone.toString(), Icons.phone_outlined),
                        SizedBox(height: 20),

                        userInfo(u.birthDate.toString(), Icons.cake_outlined),
                        SizedBox(height: 20),

                        userInfo(u.gender.toString(), Icons.person_outline),
                        SizedBox(height: 20),

                        userInfo( "${u.address!.city.toString()}, ${u.address!.country.toString()}", Icons.location_on_outlined),
                        SizedBox(height: 20),

                        userInfo(u.company!.title.toString(), Icons.work_outline),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Row userInfo(String text, IconData icon) => Row(
    children: [
      Icon(icon, size: 30, color: Colors.blue.shade700),
      SizedBox(width: 15),
      Text(text, style: TextStyle(fontSize: 15)),
    ],
  );
}