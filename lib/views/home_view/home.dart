import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermyappp/conts/conts.dart';
import 'package:fluttermyappp/views/appointment_view/appointment_view.dart';
import 'package:fluttermyappp/views/category_view/category_view.dart';
import 'package:fluttermyappp/views/home_view/home_view.dart';
import 'package:fluttermyappp/views/login_view/login_view.dart';
import 'package:fluttermyappp/views/settings_view/settings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const AppointmentView(),
    const CategoryView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: screenList.elementAt(selectedIndex),
    bottomNavigationBar: BottomNavigationBar(
      unselectedItemColor: Colors.white.withOpacity(0.5),
      selectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: TextStyle(
        color: AppColors.whiteColor,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.blueColor,
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
      onTap: (value) {
      setState(() {
        selectedIndex = value;
      });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Appointments"),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    ),
  );
  }
}