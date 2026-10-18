import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/dashboard/productsList_screen.dart';
import 'package:products/user/user_screen.dart';

class Dashboard extends StatefulWidget {
  final int id;
  Dashboard({super.key, required this.id});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final List<Widget> Screens;
  int CurrentI =0;

  @override
  void initState() {
    super.initState();
    Screens = [ProductsList(), UserScreen(id: widget.id)];
  }

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
