import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/dashboard/productDetails_screen.dart';
import 'package:products/dashboard/productsList_screen.dart';
import 'package:products/dashboard/user_details.dart';

class Dashboard extends StatefulWidget {
   Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int CurrentI =0;
  List Screens =[ProductsList(), UserDetails()];

  void changeIndex(int index)
  {
    setState(() {
      CurrentI = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: CurrentI ,
        onTap: changeIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,



        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance),
          label: "Products"),

          BottomNavigationBarItem(icon: Icon(Icons.person_2),
          label: "User Info")
        ],
      ),

      body: Screens[CurrentI],
    );
  }
}
